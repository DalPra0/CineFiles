// OnboardingContainerView.swift
import SwiftUI

struct OnboardingContainerView: View {
    @Binding var onboardingCompleto: Bool
    @State private var currentStep = 0
    let steps = OnboardingStep.sampleSteps

    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<steps.count, id: \.self) { index in
                    OnboardingStepView(step: steps[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .animation(.easeInOut, value: currentStep)

            HStack {
                if currentStep > 0 {
                    Button("Anterior") {
                        withAnimation {
                            currentStep -= 1
                        }
                    }
                    .padding()
                    .foregroundColor(.gray)
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        if currentStep < steps.count - 1 {
                            currentStep += 1
                        } else {
                            UserDefaults.standard.set(true, forKey: "onboardingCompleto")
                            onboardingCompleto = true
                        }
                    }
                }) {
                    Text(currentStep < steps.count - 1 ? "Próximo" : "Começar a Usar")
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 30)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding()
            }
            .padding(.bottom, 20)
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea())
    }
}

#Preview {
    OnboardingContainerView(onboardingCompleto: .constant(false))
}
