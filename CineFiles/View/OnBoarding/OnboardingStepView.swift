// OnboardingStepView.swift
import SwiftUI

struct OnboardingStepView: View {
    let step: OnboardingStep

    var body: some View {
        VStack(spacing: 30) {
            Image(step.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 30)
                .accessibilityLabel("Ilustração para \(step.title)")


            Text(step.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text(step.description)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    OnboardingStepView(step: OnboardingStep.sampleSteps[0])
}
