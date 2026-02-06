//
//  SidebarView.swift
//  Kalaido
//
//  Navigation sidebar component
//

import SwiftUI

/// Sidebar navigation menu
struct SidebarView: View {
    @Binding var isOpen: Bool
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 32) {
                    // Sidebar Header
                    Spacer().frame(height: 50)
                    
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .accessibilityHidden(true)
                        
                        Text("Kalaido")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(KalaidoTheme.Colors.textPrimary)
                    }
                    .padding(.top, 60)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Kalaido")
                    
                    // Menu Items
                    VStack(alignment: .leading, spacing: 24) {
                        NavigationLink(destination: SavedReflectionsView()) {
                            HStack(spacing: 16) {
                                Image(systemName: "book.closed.fill")
                                    .font(.system(size: 20))
                                Text("Your Reflections")
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(KalaidoTheme.Colors.textSecondary)
                        }
                        .accessibilityLabel("Your Reflections")
                        .accessibilityHint("View your saved story reflections")
                        
                        Button(action: {
                            isOpen = false
                            coordinator.push(.settings)
                        }) {
                             HStack(spacing: 16) {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 20))
                                Text("Settings")
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(KalaidoTheme.Colors.textSecondary)
                        }
                        .accessibilityLabel("Settings")
                        .accessibilityHint("Adjust app preferences and accessibility options")
                    }
                    
                    Spacer()
                    
                    Text("Version 1.0")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)
                        .accessibilityLabel("App version 1.0")
                }
                .padding(.horizontal, 24)
                .frame(width: min(geometry.size.width * 0.75, 300))
                .background(KalaidoTheme.Colors.sidebarBackground)
                .ignoresSafeArea()
                
                Spacer()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    SidebarView(isOpen: .constant(true))
        .environmentObject(NavigationCoordinator())
}
