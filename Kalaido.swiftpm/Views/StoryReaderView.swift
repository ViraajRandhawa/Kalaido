//
//  StoryReaderView.swift
//  Kalaido
//
//  Story reading experience with page navigation
//

import SwiftUI
import Translation

/// Full-screen story reading experience with swipe navigation
@available(iOS 18.0, *)
struct StoryReaderView: View {
    let story: Story
    let culture: Culture
    @State private var currentPage = 0
    @State private var showReflection = false
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    // Settings
    @AppStorage("hapticsEnabled") private var hapticsEnabled = true
    @AppStorage("reduceMotionEnabled") private var reduceMotionEnabled = false
    
    // Translation (iOS 18+)
    @State private var isTranslating = false
    @State private var showLanguageAlert = false
    @State private var translationConfiguration: TranslationSession.Configuration?
    
    var body: some View {
        if #available(iOS 18.0, *) {
            content
                .navigationBarTitleDisplayMode(.inline)
                .sensoryFeedback(.selection, trigger: currentPage) { _, _ in
                    hapticsEnabled
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        translationToggleButton
                    }
                }
                .alert("Language Not Available", isPresented: $showLanguageAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("To read this story in \(culture.targetLanguageName), please download \(culture.targetLanguageName) in Settings > Apps > Translate.")
                }
        } else if #available(iOS 17.0, *) {
            content
                .navigationBarTitleDisplayMode(.inline)
                .sensoryFeedback(.selection, trigger: currentPage) { _, _ in
                    hapticsEnabled
                }
        } else {
            content
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var content: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                KalaidoTheme.backgroundGradient
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Story card
                    VStack(spacing: 0) {
                        // Header with gradient
                        ZStack(alignment: .topLeading) {
                            KalaidoTheme.horizontalGradient(story.colors)
                                .frame(height: 120)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(story.title)
                                    .font(KalaidoTheme.Fonts.subheading())
                                    .foregroundColor(.white)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                                    .accessibilityAddTraits(.isHeader)
                                
                                Text(story.country)
                                    .font(KalaidoTheme.Fonts.body())
                                    .foregroundColor(.white.opacity(0.9))
                            }
                            .padding(.horizontal, 32)
                            .padding(.top, 32)
                            .padding(.trailing, 16)
                        }
                        
                        // Content Area (Swipeable)
                        TabView(selection: $currentPage) {
                            ForEach(0..<story.pageCount, id: \.self) { index in
                                VStack(spacing: 0) {
                                    // Image section
                                    if let imageName = story.image(at: index) {
                                        Image(systemName: imageName)
                                            .font(.system(size: 80))
                                            .foregroundColor(KalaidoTheme.Colors.iconMuted)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 180)
                                            .background(KalaidoTheme.Colors.imageBackground)
                                            .accessibilityHidden(true)
                                    }
                                    
                                    // Story content
                                    if #available(iOS 18.0, *) {
                                        Text(story.paragraph(at: index))
                                            .font(KalaidoTheme.Fonts.body())
                                            .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                            .lineSpacing(10)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal, 32)
                                            .padding(.top, 32)
                                            .translationTask(translationConfiguration) { session in
                                                // Attempt to translate the paragraph text for the current page
                                                // If the target language isn't available on device, show an alert and stop translating
                                                do {
                                                    _ = try await session.translate(<#String#>)
                                                } catch {
                                                    // Show alert and disable translation on failure (e.g., language not downloaded)
                                                    showLanguageAlert = true
                                                    isTranslating = false
                                                    translationConfiguration = nil
                                                }
                                            }
                                            .accessibilityLabel("Page \(index + 1) of \(story.pageCount). \(story.paragraph(at: index))")
                                    } else {
                                        Text(story.paragraph(at: index))
                                            .font(KalaidoTheme.Fonts.body())
                                            .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                            .lineSpacing(10)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal, 32)
                                            .padding(.top, 32)
                                            .accessibilityLabel("Page \(index + 1) of \(story.pageCount). \(story.paragraph(at: index))")
                                    }
                                    
                                    Spacer()
                                }
                                .tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        
                        // Navigation controls with progress bar
                        navigationControls
                            .padding(.bottom, 32)
                            .padding(.horizontal, 32)
                            .padding(.top, 16)
                    }
                    .background(KalaidoTheme.Colors.cardBackground)
                    .frame(maxWidth: min(max(0, geometry.size.width - 48), 500))
                    .frame(height: min(max(0, geometry.size.height - 100), 650)) // Constrain height comfortably
                    .cornerRadius(KalaidoTheme.CornerRadius.large)
                    .shadow(
                        color: KalaidoTheme.Shadows.elevatedCard.color,
                        radius: KalaidoTheme.Shadows.elevatedCard.radius,
                        x: KalaidoTheme.Shadows.elevatedCard.x,
                        y: KalaidoTheme.Shadows.elevatedCard.y
                    )
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    // MARK: - Navigation Controls
    
    private var navigationControls: some View {
        HStack(spacing: 16) {
            // Previous button
            Button(action: goToPreviousPage) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(currentPage > 0 ? KalaidoTheme.Colors.textSecondary : KalaidoTheme.Colors.iconMuted)
                    .frame(width: 44, height: 44)
                    .background(KalaidoTheme.Colors.cardBackground)
                    .cornerRadius(22)
            }
            .disabled(currentPage == 0)
            .accessibilityLabel("Previous page")
            .accessibilityHint(currentPage > 0 ? "Go to page \(currentPage)" : "You are on the first page")
            
            // Progress bar
            progressBar
            
            // Next button
            Button(action: goToNextPage) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(
                        KalaidoTheme.horizontalGradient(story.colors)
                    )
                    .cornerRadius(22)
            }
            .accessibilityLabel(currentPage < story.pageCount - 1 ? "Next page" : "Complete story")
            .accessibilityHint(currentPage < story.pageCount - 1 ? "Go to page \(currentPage + 2)" : "Proceed to reflection")
        }
    }
    
    private var progressBar: some View {
        ZStack(alignment: .leading) {
            // Background track
            RoundedRectangle(cornerRadius: 4)
                .fill(KalaidoTheme.Colors.progressTrack)
                .frame(height: 6)
            
            // Progress fill
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 4)
                    .fill(KalaidoTheme.horizontalGradient(story.colors))
                    .frame(width: min(geo.size.width, geo.size.width * CGFloat(currentPage + 1) / CGFloat(max(1, story.pageCount))), height: 6)
                    .animation(.easeInOut(duration: 0.3), value: currentPage)
            }
        }
        .frame(height: 6)
        .accessibilityLabel("Reading progress: page \(currentPage + 1) of \(story.pageCount)")
    }
    
    // MARK: - Navigation Actions
    
    private func goToPreviousPage() {
        if currentPage > 0 {
            withAnimation(reduceMotionEnabled ? .linear(duration: 0) : .default) {
                currentPage -= 1
            }
        }
    }
    
    private func goToNextPage() {
        if currentPage < story.pageCount - 1 {
            withAnimation(reduceMotionEnabled ? .linear(duration: 0) : .default) {
                currentPage += 1
            }
        } else {
            coordinator.push(.reflection(story))
        }
    }
    
    // MARK: - Translation Toggle (iOS 18+)
    
    @available(iOS 18.0, *)
    @ViewBuilder
    private var translationToggleButton: some View {
        Button(action: toggleTranslation) {
            Image(systemName: isTranslating ? "globe.badge.chevron.backward.fill" : "globe")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(isTranslating ? story.colors.first : KalaidoTheme.Colors.textSecondary)
                .frame(width: 44, height: 44)
                .contentTransition(.symbolEffect(.replace))
        }
        .accessibilityLabel(isTranslating ? "Stop translating to \(culture.targetLanguageName)" : "Translate to \(culture.targetLanguageName)")
        .accessibilityHint("Double tap to toggle translation")
    }
    
    @available(iOS 18.0, *)
    private func toggleTranslation() {
        withAnimation(.easeInOut(duration: 0.3)) {
            isTranslating.toggle()
        }
        
        if isTranslating {
            // Configure translation session
            translationConfiguration = TranslationSession.Configuration(
                source: .init(identifier: "en"),
                target: culture.targetLanguage
            )
        } else {
            // Stop translation
            translationConfiguration = nil
        }
    }
}

// MARK: - Preview

#Preview {
    if #available(iOS 18.0, *) {
        NavigationStack {
            if let culture = StoryData.culture(for: StoryData.celebrationStory) {
                StoryReaderView(story: StoryData.celebrationStory, culture: culture)
            }
        }
        .environmentObject(NavigationCoordinator())
    } else {
        Text("StoryReaderView requires iOS 18.0 or newer for translation features.")
            .padding()
    }
}
