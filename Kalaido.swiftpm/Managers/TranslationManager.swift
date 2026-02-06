//
//  TranslationManager.swift
//  Kalaido
//
//  Manages translation sessions for iOS 18 Translation framework
//

import SwiftUI
import Translation

/// Manages translation state and sessions for cultural stories
@available(iOS 18.0, *)
@MainActor
@Observable
class TranslationManager {
    static let shared = TranslationManager()
    
    // MARK: - Published State
    
    /// Whether translation is currently active
    var isTranslating: Bool = false
    
    /// The target language for translation
    var targetLanguage: Locale.Language?
    
    /// Whether to show the language download alert
    var showLanguageAlert: Bool = false
    
    /// Alert message to display to the user
    var alertMessage: String = ""
    
    /// The name of the target language (for UI display)
    var targetLanguageName: String = ""
    
    // MARK: - Private Properties
    
    private init() {}
    
    // MARK: - Computed Properties
    
    /// Translation configuration for use with .translationTask modifier
    var configuration: TranslationSession.Configuration? {
        guard isTranslating, let targetLanguage = targetLanguage else {
            return nil
        }
        
        return TranslationSession.Configuration(
            source: .init(identifier: "en"),
            target: targetLanguage
        )
    }
    
    // MARK: - Public Methods
    
    /// Start translation to the specified language
    /// - Parameters:
    ///   - language: The target language locale
    ///   - languageName: Human-readable name of the language
    func startTranslation(to language: Locale.Language, languageName: String) {
        self.targetLanguage = language
        self.targetLanguageName = languageName
        self.isTranslating = true
    }
    
    /// Stop translation and return to original English text
    func stopTranslation() {
        self.isTranslating = false
        self.targetLanguage = nil
        self.targetLanguageName = ""
    }
    
    /// Toggle translation on/off
    /// - Parameters:
    ///   - language: The target language locale
    ///   - languageName: Human-readable name of the language
    func toggleTranslation(to language: Locale.Language, languageName: String) {
        if isTranslating {
            stopTranslation()
        } else {
            startTranslation(to: language, languageName: languageName)
        }
    }
    
    /// Show an alert when the required language is not downloaded
    /// - Parameter languageName: The name of the language that needs to be downloaded
    func showLanguageNotAvailableAlert(for languageName: String) {
        self.alertMessage = "To read this story in \(languageName), please download \(languageName) in Settings > Apps > Translate."
        self.showLanguageAlert = true
    }
    
    /// Dismiss the language alert
    func dismissAlert() {
        self.showLanguageAlert = false
        self.alertMessage = ""
    }
}
