import SwiftUI

// MARK: - User Model
struct User {
    let email: String
    let password: String
}

// MARK: - Authentication Manager
class AuthManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUser: User?
    
    func login(email: String, password: String) -> Bool {
        // Validação básica
        guard !email.isEmpty && !password.isEmpty else {
            return false
        }
        
        // Simulação de autenticação (você pode adicionar validações mais complexas aqui)
        let user = User(email: email, password: password)
        self.currentUser = user
        self.isLoggedIn = true
        return true
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
    }
}

// MARK: - Login View
struct LoginView: View {
    @StateObject private var authManager = AuthManager()
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login CineFilés")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 50)
                
                Spacer()
                
                VStack(spacing: 15) {
                    TextField("E-mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Senha", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                
                Button("Entrar") {
                    attemptLogin()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .disabled(email.isEmpty || password.isEmpty)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .alert("Erro", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
            .fullScreenCover(isPresented: $authManager.isLoggedIn) {
                TabBarView()
                    .environmentObject(authManager)
            }
        }
    }
    
    private func attemptLogin() {
        if authManager.login(email: email, password: password) {
            // Login bem-sucedido - a tela principal será apresentada automaticamente
        } else {
            alertMessage = "Por favor, preencha todos os campos"
            showAlert = true
        }
    }
}
