// CineFilesApp.swift
import SwiftUI

@main
struct CineFilesApp: App {
    @AppStorage("onboardingCompleto") private var onboardingCompleto: Bool = false

    var body: some Scene {
        WindowGroup {
            // let _ = UserDefaults.standard.set(false, forKey: "onboardingCompleto")

            if onboardingCompleto {
                LoginView()
            } else {
                OnboardingContainerView(onboardingCompleto: $onboardingCompleto)
            }
        }
    }
}
