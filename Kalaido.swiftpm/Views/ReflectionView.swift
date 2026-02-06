//
//  ReflectionView.swift
//  Kalaido
//
//  Post-story reflection screen with feelings selection
//

import SwiftUI

/// Reflection screen shown after completing a story
struct ReflectionView: View {
    let story: Story
    @EnvironmentObject var coordinator: NavigationCoordinator
    @EnvironmentObject var manager: ReflectionManager
    @Environment(\.dismiss) var dismiss
    
    @State private var showCulturalContext = false
    @State private var selectedFeelings: Set<String> = []
    @State private var reflectionText: String = ""
    @State private var didSave = false // Trigger for haptic
    @FocusState private var isTextFieldFocused: Bool
    
    private let feelings = [
        "Happy", "Curious", "Peaceful", "Surprised",
        "Grateful", "Thoughtful", "Connected", "Sad",
        "Hopeful", "Confused", "Inspired", "Calm"
    ]
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ZStack {
                KalaidoTheme.backgroundGradient
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Spacer()
                            .frame(height: 20)
                        
                        // Story indicator
                        Circle()
                            .fill(KalaidoTheme.horizontalGradient(story.colors))
                            .frame(width: 20, height: 20)
                            .accessibilityHidden(true)
                        
                        // Header text
                        VStack(spacing: 16) {
                            Text("Take a moment to sit with this story")
                                .font(.system(size: 26, weight: .regular, design: .serif))
                                .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                .multilineTextAlignment(.center)
                                .accessibilityAddTraits(.isHeader)
                            
                            Text("What did you notice?")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(KalaidoTheme.Colors.textTertiary)
                        }
                        .padding(.horizontal, 40)
                        
                        Spacer()
                            .frame(height: 32)
                        
                        // Feelings selection
                        feelingsSection
                        
                        Spacer()
                            .frame(height: 24)
                        
                        // Save button (only shown when feelings are selected)
                        if !selectedFeelings.isEmpty || !reflectionText.isEmpty {
                            saveButton
                                .transition(.opacity)
                        }
                        
                        Spacer()
                            .frame(height: 16)
                        
                        // Return home button - proper pop to root
                        returnHomeButton
                        
                        Spacer()
                            .frame(height: 12)
                        
                        // Cultural context button
                        Button(action: {
                            withAnimation {
                                showCulturalContext = true
                            }
                        }) {
                            Text("Learn more about this moment")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                .underline()
                        }
                        .accessibilityLabel("Learn more about this cultural moment")
                        .accessibilityHint("Opens additional context about the \(story.country) culture")
                        
                        Spacer()
                            .frame(height: 32)
                    }
                }
                .onTapGesture {
                    isTextFieldFocused = false
                }
                
                // Cultural context sheet
                if showCulturalContext {
                    culturalContextSheet
                }
            }
            .sensoryFeedback(.success, trigger: didSave)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Feelings Section
    
    private var feelingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("How did this story make you feel?")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(KalaidoTheme.Colors.textPrimary)
                .padding(.horizontal, 24)
            
            FlowLayout(spacing: 10) {
                ForEach(feelings, id: \.self) { feeling in
                    feelingChip(feeling)
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    private func feelingChip(_ feeling: String) -> some View {
        Button(action: {
            if selectedFeelings.contains(feeling) {
                selectedFeelings.remove(feeling)
            } else {
                selectedFeelings.insert(feeling)
            }
        }) {
            Text(feeling)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(selectedFeelings.contains(feeling) ? .white : KalaidoTheme.Colors.textSecondary)
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(
                    selectedFeelings.contains(feeling)
                    ? KalaidoTheme.horizontalGradient(story.colors)
                    : LinearGradient(colors: [.white, .white], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            selectedFeelings.contains(feeling) ? Color.clear : KalaidoTheme.Colors.border,
                            lineWidth: 1
                        )
                )
        }
        .accessibilityLabel(feeling)
        .accessibilityAddTraits(selectedFeelings.contains(feeling) ? [.isButton, .isSelected] : .isButton)
        .accessibilityHint(selectedFeelings.contains(feeling) ? "Selected. Double tap to deselect" : "Double tap to select")
    }
    
    // MARK: - Save Button
    
    private var saveButton: some View {
        Button(action: saveReflection) {
            Text("Save Reflection")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: 280)
                .padding(.vertical, 14)
                .background(KalaidoTheme.horizontalGradient(story.colors))
                .cornerRadius(KalaidoTheme.CornerRadius.pill)
        }
        .accessibilityLabel("Save reflection")
        .accessibilityHint("Saves your feelings about this story and returns to home")
    }
    
    private func saveReflection() {
        manager.saveReflection(
            story: story,
            feelings: selectedFeelings,
            notes: reflectionText
        )
        
        // Trigger haptic via sensoryFeedback modifier
        didSave.toggle()
        
        // Return to previous screen
        coordinator.pop()
    }
    
    // MARK: - Return Home Button
    
    private var returnHomeButton: some View {
        Button(action: {
            // Pop back to root (ChooseMoment is the first view in the NavStack after Welcome)
            coordinator.popToRoot()
        }) {
            Text("Read Another Story")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                .frame(maxWidth: 280)
                .padding(.vertical, 14)
                .background(KalaidoTheme.Colors.cardBackground)
                .cornerRadius(KalaidoTheme.CornerRadius.pill)
                .overlay(
                    RoundedRectangle(cornerRadius: KalaidoTheme.CornerRadius.pill)
                        .stroke(KalaidoTheme.Colors.border, lineWidth: 1)
                )
        }
        .accessibilityLabel("Read another story")
        .accessibilityHint("Returns to the story selection screen")
    }
    
    // MARK: - Cultural Context Sheet
    
    private var culturalContextSheet: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Cultural Context")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(KalaidoTheme.Colors.textPrimary)
                    .accessibilityAddTraits(.isHeader)
                
                Text(story.culturalContext)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(red: 0.3, green: 0.25, blue: 0.2))
                    .lineSpacing(6)
                
                Button(action: {
                    withAnimation {
                        showCulturalContext = false
                    }
                }) {
                    Text("Close")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(KalaidoTheme.Colors.textSecondary)
                }
                .padding(.top, 8)
                .accessibilityLabel("Close cultural context")
            }
            .padding(28)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(KalaidoTheme.Colors.cardBackground)
            .cornerRadius(KalaidoTheme.CornerRadius.large, corners: [.topLeft, .topRight])
            .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -5)
        }
        .ignoresSafeArea()
        .transition(.move(edge: .bottom))
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ReflectionView(story: StoryData.celebrationStory)
    }
    .environmentObject(NavigationCoordinator())
    .environmentObject(ReflectionManager())
}
