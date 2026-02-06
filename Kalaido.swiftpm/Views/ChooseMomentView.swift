//
//  ChooseMomentView.swift
//  Kalaido
//
//  Story selection screen with cultural moment cards
//

import SwiftUI

/// Screen where users choose a cultural story to read
struct ChooseMomentView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @State private var showSidebar = false
    @State private var searchText = ""
    
    // Filter cultures and stories based on search text
    var filteredCultures: [Culture] {
        if searchText.isEmpty {
            return StoryData.cultures
        } else {
            return StoryData.cultures.compactMap { culture in
                let cultureMatches = culture.name.localizedCaseInsensitiveContains(searchText) || 
                                     culture.region.localizedCaseInsensitiveContains(searchText)
                
                let matchingStories = culture.stories.filter { story in
                    story.title.localizedCaseInsensitiveContains(searchText) ||
                    story.country.localizedCaseInsensitiveContains(searchText)
                }
                
                if cultureMatches {
                    // Return all stories if culture matches
                    return culture
                } else if !matchingStories.isEmpty {
                    // Return culture with only matching stories
                    // Reuse ID to prevent UI glitches
                    return Culture(
                        id: culture.id,
                        name: culture.name,
                        description: culture.description,
                        region: culture.region,
                        stories: matchingStories
                    )
                }
                return nil
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Main Content
            VStack(spacing: 0) {
                // Background
                KalaidoTheme.backgroundGradient
                    .ignoresSafeArea()
                    .overlay {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) { // Keep VStack for the static header parts
                                // Header
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Choose a Moment")
                                        .font(KalaidoTheme.Fonts.heading())
                                        .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                        .accessibilityAddTraits(.isHeader)
                                    
                                    Text("Each experience opens a window into someone's life")
                                        .font(KalaidoTheme.Fonts.body())
                                        .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                }
                                .padding(.horizontal, 24)
                                .padding(.top, 20)
                                .padding(.bottom, 32)
                                
                                // Search Bar
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                    
                                    TextField("Search stories, cultures...", text: $searchText)
                                        .font(KalaidoTheme.Fonts.body())
                                        .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                        .accessibilityLabel("Search stories")
                                    
                                    if !searchText.isEmpty {
                                        Button(action: { searchText = "" }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                        }
                                        .accessibilityLabel("Clear search")
                                    }
                                }
                                .padding()
                                .background(KalaidoTheme.Colors.cardBackground)
                                .cornerRadius(KalaidoTheme.CornerRadius.medium)
                                .padding(.horizontal, 24)
                                .padding(.bottom, 24)
                                
                                // Categorized Stories
                                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                                    if filteredCultures.isEmpty {
                                        VStack(spacing: 16) {
                                            Image(systemName: "magnifyingglass")
                                                .font(.system(size: 40))
                                                .foregroundColor(KalaidoTheme.Colors.iconMuted)
                                            Text("No stories found")
                                                .font(KalaidoTheme.Fonts.subheading())
                                                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                                            Text("Try searching for a different country or topic")
                                                .font(KalaidoTheme.Fonts.body())
                                                .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.top, 40)
                                        .accessibilityElement(children: .combine)
                                    } else {
                                        ForEach(filteredCultures) { culture in
                                            Section(header: CultureSectionHeader(culture: culture)) {
                                                ForEach(culture.stories) { story in
                                                    MomentCard(story: story)
                                                        .padding(.horizontal, 24)
                                                        .padding(.bottom, 16)
                                                }
                                                .padding(.top, 8)
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom, 32)
                            }
                        }
                    }
            }
            .offset(x: showSidebar ? 280 : 0)
            .disabled(showSidebar)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showSidebar)
            
            // Sidebar Overlay
            if showSidebar {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showSidebar = false }
                    .transition(.opacity)
                    .accessibilityLabel("Close sidebar")
                    .accessibilityAddTraits(.isButton)
                
                SidebarView(isOpen: $showSidebar)
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { showSidebar.toggle() }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(KalaidoTheme.Colors.textSecondary)
                }
                .accessibilityLabel("Open menu")
                .accessibilityHint("Opens the navigation sidebar")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ChooseMomentView()
    }
    .environmentObject(NavigationCoordinator())
    .environmentObject(ReflectionManager())
}

/// Header view for culture sections
struct CultureSectionHeader: View {
    let culture: Culture
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(culture.name)
                .font(KalaidoTheme.Fonts.subheading())
                .foregroundColor(KalaidoTheme.Colors.textPrimary)
            
            Text(culture.description)
                .font(KalaidoTheme.Fonts.caption())
                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(KalaidoTheme.Colors.backgroundPrimary) // Opaque background for sticky header
        .accessibilityAddTraits(.isHeader)
    }
}
