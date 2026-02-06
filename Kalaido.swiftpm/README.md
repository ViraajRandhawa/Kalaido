# Kalaido 🌈

**Cultural Storytelling Through Visual Narratives**

Kalaido is an offline-first SwiftUI app that shares intimate cultural moments from around the world through gentle, emotionally resonant storytelling. Step into the lives of people from diverse cultures—one story at a time.

---

## 🎯 Purpose

Built for the **Apple Swift Student Challenge 2026**, Kalaido demonstrates:

- **Clean SwiftUI Architecture** — Coordinator pattern, centralized design system, and type-safe navigation
- **Comprehensive Accessibility** — VoiceOver, Dynamic Type, haptic feedback, and high contrast support
- **Offline-First Design** — No network dependencies; all content stored locally
- **Emotional Design** — Warm aesthetics with adaptive light/dark mode support

---

## 📱 Features

- **12+ Cultures, 36+ Stories** — Diverse narratives from India, Japan, Italy, Nigeria, Mexico, Brazil, South Korea, Morocco, and more
- **Gentle Reading Experience** — Page-by-page navigation with smooth haptic feedback
- **Personal Reflections** — Record your emotional responses after each story
- **Progress Tracking** — Visual feedback on completed cultural moments
- **Swipe-to-Delete** — Manage your saved reflections easily
- **Accessibility Settings** — Dyslexic-friendly fonts, adjustable text size, reduce motion, high contrast

---

## 🛠 Technical Stack

| Requirement | Version |
|------------|---------|
| **iOS** | 16.0+ (enhanced haptics on iOS 17+) |
| **Xcode** | 15.2+ |
| **Swift** | 6.0 |
| **Dependencies** | None — pure Apple frameworks |

---

## 🏗 Architecture

### Project Structure

```
Kalaido.swiftpm/
├── MyApp.swift               # App entry point
├── Package.swift             # Swift Playground manifest
├── Views/
│   ├── WelcomeView.swift     # Home and Navigation Root
│   ├── OnboardingView.swift  # App Introduction
│   ├── ChooseMomentView.swift # Story Selection
│   ├── StoryReaderView.swift # Interactive Reading
│   ├── ReflectionView.swift  # Post-Story Reflection
│   ├── SavedReflectionsView.swift # Journal
│   ├── SettingsView.swift    # App Preferences
│   └── Components/           # Reusable UI (MomentCard, SidebarView, FlowLayout)
├── Models/
│   ├── Story.swift           # Story model
│   ├── Culture.swift         # Culture model
│   └── ReflectionEntry.swift # Saved reflection model
├── Data/
│   ├── CultureData.swift     # All cultural content
│   ├── StoryData.swift       # Story access helpers
│   └── ReflectionManager.swift # Persistence layer
└── Utilities/
    ├── NavigationCoordinator.swift # Centralized routing
    ├── Theme.swift           # Design system (colors, fonts, shadows)
    └── ViewExtensions.swift  # SwiftUI helpers
```

### Key Design Patterns

- **Coordinator Pattern** — `NavigationCoordinator` manages app state and navigation
- **Design System** — `KalaidoTheme` provides adaptive colors, fonts, and styling tokens
- **Observable State** — `ReflectionManager` handles persistence with UserDefaults

---

## 🎨 Design Philosophy

Kalaido uses a **warm cream-and-earth palette** in light mode, evoking "reading by candlelight." Dark mode provides a soft, warm charcoal background that maintains the cozy atmosphere. The design system adapts automatically to the user's system appearance preference.

---

## ♿️ Accessibility

Accessibility is a core feature:

- **VoiceOver** — Custom labels, hints, and header traits throughout
- **Haptics** — Sensory feedback for page turns (iOS 16 fallback included)
- **Dynamic Type** — Scalable fonts and responsive layouts
- **High Contrast** — Enhanced contrast mode available in settings
- **Reduce Motion** — Respects user motion preferences
- **Dyslexic-Friendly Font** — Optional rounded font for easier reading

---

## 🚀 Getting Started

1. Open `Kalaido.swiftpm` in **Xcode 15.2+** or **Swift Playgrounds**
2. Select an **iPad** simulator or device for the best experience
3. Build and run — no setup required

> **Note:** This is a Swift Playground project (`.swiftpm`), not an Xcode project (`.xcodeproj`).

---

## 📦 Swift Student Challenge Compliance

| Requirement | Status |
|-------------|--------|
| Offline Only | ✅ No networking code |
| Privacy First | ✅ No analytics or tracking |
| Pure Swift | ✅ SwiftUI + Foundation only |
| No Dependencies | ✅ Zero third-party packages |
| Local Persistence | ✅ UserDefaults only |

---

**Created by:** Viraaj Randhawa  
**Challenge:** Apple Swift Student Challenge 2026  
**Last Updated:** February 2026
