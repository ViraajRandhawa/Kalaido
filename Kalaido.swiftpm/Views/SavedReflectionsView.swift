//
//  SavedReflectionsView.swift
//  Kalaido
//
//  Journal view showing all saved reflections
//

import SwiftUI

/// Displays all saved reflections as a journal
struct SavedReflectionsView: View {
    @EnvironmentObject var manager: ReflectionManager
    
    var body: some View {
        ZStack {
            KalaidoTheme.Colors.backgroundPrimary
                .ignoresSafeArea()
            
            if manager.reflections.isEmpty {
                emptyState
            } else {
                reflectionsList
            }
        }
        .navigationTitle("Your Journal")
    }
    
    // MARK: - Empty State
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "pencil.and.outline")
                .font(.system(size: 48))
                .foregroundColor(.gray.opacity(0.5))
                .accessibilityHidden(true)
            
            Text("No reflections yet")
                .font(.title3)
                .foregroundColor(.gray)
            
            Text("Read a story to start your journal")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("No reflections yet. Read a story to start your journal.")
    }
    
    // MARK: - Reflections List
    
    private var reflectionsList: some View {
        List {
            ForEach(manager.reflections) { entry in
                ReflectionRow(entry: entry)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Reflection Row

private struct ReflectionRow: View {
    let entry: ReflectionEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Text(entry.storyTitle)
                    .font(.headline)
                    .foregroundColor(KalaidoTheme.Colors.textPrimary)
                
                Spacer()
                
                Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Feelings chips
            if !entry.feelings.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(entry.feelings, id: \.self) { feeling in
                            Text(feeling)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(KalaidoTheme.Colors.progressTrack)
                                .cornerRadius(8)
                        }
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Feelings: \(entry.feelings.joined(separator: ", "))")
            }
            
            // Notes
            if !entry.notes.isEmpty {
                Text(entry.notes)
                    .font(.body)
                    .foregroundColor(Color(red: 0.3, green: 0.25, blue: 0.2))
                    .lineLimit(3)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: KalaidoTheme.CornerRadius.small)
                .fill(KalaidoTheme.Colors.cardBackground)
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Reflection for \(entry.storyTitle) from \(entry.storyCountry) on \(entry.date.formatted(date: .abbreviated, time: .omitted))")
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        SavedReflectionsView()
    }
    .environmentObject(ReflectionManager())
}
