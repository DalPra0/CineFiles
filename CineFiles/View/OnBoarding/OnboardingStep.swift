// OnboardingStep.swift
import SwiftUI

struct OnboardingStep: Identifiable {
    let id = UUID()
    let imageName: String // Nome da imagem no seu asset catalog
    let title: String
    let description: String
}

// Dados para as telas de onboarding
extension OnboardingStep {
    static var sampleSteps: [OnboardingStep] = [
        OnboardingStep(imageName: "onboarding_discover", title: "Bem-vindo ao CineFiles!", description: "Explore um universo de filmes e séries. Encontre novos favoritos e clássicos inesquecíveis."),
        OnboardingStep(imageName: "onboarding_organize", title: "Organize Seus Filmes", description: "Crie listas personalizadas, marque os que já assistiu e nunca mais perca um filme que deseja ver."),
        OnboardingStep(imageName: "onboarding_search", title: "Pesquisa Inteligente", description: "Encontre facilmente o que procura com nossa busca detalhada por título, gênero, ator ou diretor."),
        OnboardingStep(imageName: "onboarding_ready", title: "Tudo Pronto?", description: "Sua jornada cinematográfica está prestes a começar. Prepare a pipoca!")
    ]
}
