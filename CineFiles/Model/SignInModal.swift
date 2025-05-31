////
////  SignInModal.swift
////  SwiftUI-Challenge-Aula05
////
////  Created by Gustavo Munhoz Correa on 22/05/25.
////
//
//import SwiftUI
//
//struct SignInModal: View {
//    
//    @State private var email: String = ""
//    @State private var password: String = ""
//    
//    @State private var showIncorrectPassword = false
//    
//    @State var showAlert = false
//    
//    private var canConfirmSignIn: Bool {
//        !email.isEmpty && !password.isEmpty
//    }
//    
//    // TODO: Implementar alerta
//    var body: some View {
//        VStack(alignment: .leading, spacing: 24) {
//            Text("Bem-vindo de volta")
//                .font(.title)
//                .fontWeight(.bold)
//            
//            Form {
//                Section {
//                    TextField(
//                        "",
//                        text: $email,
//                        prompt: Text("Insira o seu e-mail")
//                            .foregroundStyle(.customTertiaryLabel)
//                    )
//                    .font(.subheadline)
//                    .foregroundStyle(.primary)
//                    .padding()
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(.miscellaneous, lineWidth: 1)
//                    }
//                    .textContentType(.emailAddress)
//                    
//                } header: {
//                    Text("E-mail")
//                        .font(.subheadline)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.secondary)
//                }
//                
//                Spacer()
//                    .frame(height: 24)
//                
//                Section {
//                    VStack {
//                        SecureField(
//                            "",
//                            text: $password,
//                            prompt: Text("Insira a sua senha")
//                                .foregroundStyle(.customTertiaryLabel)
//                        )
//                        .font(.subheadline)
//                        .foregroundStyle(.primary)
//                        .padding()
//                        .overlay {
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(
//                                    showIncorrectPassword ? .red : .miscellaneous,
//                                    lineWidth: 1
//                                )
//                        }
//                        .textContentType(.password)
//                        
//                        if showIncorrectPassword {
//                            HStack {
//                                Image(systemName: "exclamationmark.triangle")
//                                Text("Senha incorreta. Por favor, tente novamente.")
//                            }
//                            .font(.footnote)
//                            .foregroundStyle(.red)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        }
//                    }
//                    
//                } header: {
//                    HStack {
//                        Text("Senha")
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.secondary)
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            // TODO: Implementar ação
//                            showAlert = true
//                        }) {
//                            Text("Recuperar senha")
//                                .font(.subheadline)
//                        }
//                    }
//                }
//            }
//            .formStyle(.columns)
//            
//            Button(action: {
//                withAnimation {
//                    showIncorrectPassword = true
//                }
//            }) {
//                Text("Confirmar")
//                    .frame(maxWidth: .infinity, maxHeight: 50)
//                    .foregroundStyle(
//                        canConfirmSignIn ? .white : .customTertiaryLabel
//                    )
//                    .background(
//                        canConfirmSignIn ? .buttonPurple : .tertiaryFill
//                    )
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//            }
//            .disabled(!canConfirmSignIn)
//            
//            Button(action: {
//                // Não faz nada
//            }) {
//                HStack {
//                    Image(systemName: "apple.logo")
//                    Text("Continuar com Apple")
//                }
//                .frame(maxWidth: .infinity, maxHeight: 50)
//                .foregroundStyle(.white)
//                .background(.black)
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//            }
//            
//            Text(
//                try! AttributedString(markdown: "Não tem uma conta? [Cadastre-se](https://www.youtube.com/watch?v=dQw4w9WgXcQ)")
//            )
//            .font(.subheadline)
//            .foregroundStyle(.secondary)
//            .frame(maxWidth: .infinity, alignment: .center)
//        }
//        .padding()
//        .alert("Verifique sua conta", isPresented: $showAlert){
//            Button(action: {
//            }) {
//                Text("Fechar")
//                    .fontWeight(.semibold)
//            }
//        } message: {
//            Text("Enviamos um email de confirmacao")
//                .font(.subheadline)
//        }
//    }
//}
//
//#Preview {
//    SignInModal()
//}
