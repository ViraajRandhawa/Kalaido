# Kalaido Submission Verification Checklist

Before final submission to the Apple Swift Student Challenge, ensure every box is checked.

## 📱 Device & Layout Verification

### iPhone SE (Small Screen)
- [ ] Onboarding text is fully visible without overlap.
- [ ] Sidebar takes up ~75% of the screen (not overflowing).
- [ ] "Begin" button is tappable and correctly sized.
- [ ] Moment cards remain legible.

### iPhone 15 Pro Max (Large Screen)
- [ ] Gradients fill the screen edge-to-edge.
- [ ] Typography looks balanced (not too small for the screen).
- [ ] Tap targets are generous.

### iPad Pro (Tablet Support)
- [ ] Story reader card is centered and capped at 500pt width.
- [ ] Sidebar appears as a slide-over at a proportional width.
- [ ] High-resolution images/symbols look crisp.

## 🧩 Functional Verification

### Data & Content
- [ ] All 8 stories from `stories.json` load on the first screen.
- [ ] No visual "flashing" while stories are loading.
- [ ] Fallback story appears if `stories.json` is missing or corrupted.

### Navigation Flow
- [ ] "Begin" leads to the Moment Selection screen.
- [ ] Tapping a card opens the correct Story Reader.
- [ ] Swiping through pages works with haptic feedback.
- [ ] Reaching the last page triggers the "Reflection" button.
- [ ] "Read Another Story" returns correctly to the selection list (pop To Root).

### Persistence
- [ ] Saving a reflection shows a success haptic/feedback.
- [ ] Saved reflections appear in "Your Reflections" sidebar.
- [ ] Deleting a reflection works and persists after app restart.
- [ ] "Completed" badges appear on cards after finishing a story.

## ♿️ Accessibility & Compliance

### VoiceOver & Dynamic Type
- [ ] Enable VoiceOver: Can you complete a story and save a reflection?
- [ ] Increase Text Size: Do any layouts break or text get truncated?
- [ ] Ensure all SF Symbols have `accessibilityHidden(true)` if they are purely decorative.

### Rule Compliance
- [ ] Verify `Info.plist` has NO networking permissions.
- [ ] Search the project for any `import` of 3rd party libraries (should be zero).
- [ ] Ensure zero `print` statements remain in production-facing code.

## 🛠 Project Health
- [ ] **Build Check**: Project builds with zero errors and zero warnings.
- [ ] **Data Validity**: `stories.json` matches the `Story` struct schema exactly.
- [ ] **README**: Is updated and contains 1-2 sentences about the design intent.

---
*Signed off by:* **Viraaj Randhawa**
*Date:* 2026-01-27
