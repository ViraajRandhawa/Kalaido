# Kalaido 🌈

**Cultural Storytelling Through Visual Narratives**

Kalaido is an offline-first SwiftUI app that shares intimate cultural moments from around the world through gentle, emotionally resonant storytelling. It is designed to be a window into the diverse lives of people globally, fostering empathy and connection one story at a time.

## 🎯 Purpose

Built for the Apple Swift Student Challenge 2026, Kalaido demonstrates:
- **Clean SwiftUI Architecture**: Optimized for performance and readability.
- **Comprehensive Accessibility**: A first-class citizen in the design process.
- **Offline-First Design**: Reliability without dependencies.
- **Emotional Design**: Warm aesthetics tailored for children and first-time users.

## 📱 Features

- **8 Cultural Stories**: Diverse narratives from India, Japan, Italy, Nigeria, Mexico, Brazil, South Korea, and Morocco.
- **Gentle Reading Experience**: Page-by-page navigation with smooth haptic feedback.
- **Personal Reflections**: A safe space for users to record their emotional responses to each story.
- **Progress Tracking**: Visual feedback on completed cultural moments.
- **Advanced Accessibility**: Specifically tuned for VoiceOver and High Contrast users.

## 🛠 Technical Stack

- **SwiftUI** (Targeting iOS 17+)
- **Swift 5.9+**
- **No Third-Party Dependencies**: Pure Apple frameworks only.
- **Local Persistence**: Using `Codable` and `UserDefaults` for lightweight, reliable data handling.

## 🏗 Architecture

### Project Structure
```
Kalaido/
├── KalaidoApp.swift          # App entry point
├── Views/                     # UI Layer
│   ├── WelcomeView.swift      # Home and Navigation Root
│   ├── OnboardingView.swift   # App Introduction
│   ├── ChooseMomentView.swift # Story Selection List
│   ├── StoryReaderView.swift  # Interactive Reading Experience
│   ├── ReflectionView.swift   # Post-Story Input
│   └── Components/            # Reusable UI Elements (Card, Sidebar, etc.)
├── Models/                    # Domain Layer
│   ├── Story.swift            # Cultural Story model
│   └── ReflectionEntry.swift  # User's saved notes
├── Data/                      # Persistence & Content Layer
│   ├── StoryData.swift        # JSON Loader logic
│   ├── stories.json           # All cultural content (JSON)
│   └── ReflectionManager.swift # State & Storage management
└── Utilities/                 # Cross-cutting concerns
    ├── NavigationCoordinator.swift # Centralized routing
    ├── Theme.swift            # Design system tokens
    └── ViewExtensions.swift   # SwiftUI helpers
```

### Key Design Patterns
- **Coordinator Pattern**: A centralized `NavigationCoordinator` manages the app's stateful navigation path, ensuring predictable user flows.
- **Design System**: All UI elements reference shared tokens in `Theme.swift`, making the app visual consistent and easy to skin.
- **Content Decoupling**: Content is stored in `stories.json`, separate from view logic, allowing for easy updates and localizations.

## 🎨 Design Philosophy

Kalaido uses a curated **warm cream-and-earth palette** to evoke the feeling of "reading by candlelight." The design intentionally avoids a traditional Dark Mode to maintain this emotional warmth, though it remains fully WCAG AA compliant for contrast and accessibility.

## ♿️ Accessibility

Accessibility wasn't an afterthought—it's part of the core experience:
- **VoiceOver**: Custom labels and hints for all interactive elements.
- **Haptics**: Sensory feedback for page turns and successful saves.
- **Dynamic Type**: Layouts that gracefully adapt to large font sizes.
- **Semantic HTML**: Proper heading hierarchy and button traits.

## 🚀 Getting Started

1. Open `Kalaido.xcodeproj` in Xcode 15 or later.
2. Select an iOS 17+ simulator or physical device.
3. Build and run. No networking or setup is required.

## 📦 Compliance

The app strictly follows the rules for the Apple Swift Student Challenge:
- ✅ **Offline Only**: No APIs, CloudKit, or networking.
- ✅ **Privacy First**: No analytics or tracking.
- ✅ **Pure Swift**: Uses only foundational Swift and SwiftUI features.

---
**Created by**: Viraaj Randhawa
**Date**: January 2026
**Challenge**: Apple Swift Student Challenge 2026
