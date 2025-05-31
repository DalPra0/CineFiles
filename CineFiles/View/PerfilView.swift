import SwiftUI

// MARK: - Profile View
struct PerfilView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var showLogoutAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Foto de perfil placeholder
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .padding(.top, 30)
                
                // Informações do usuário
                VStack(spacing: 10) {
                    Text("Informações do Perfil")
                        .font(.title2)
                        .bold()
                    
                    if let user = authManager.currentUser {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(.blue)
                                Text("E-mail:")
                                    .font(.headline)
                                Spacer()
                            }
                            Text(user.email)
                                .foregroundColor(.secondary)
                                .padding(.leading, 25)
                            
                            Divider()
                            
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.blue)
                                Text("Senha:")
                                    .font(.headline)
                                Spacer()
                            }
                            Text(String(repeating: "•", count: user.password.count))
                                .foregroundColor(.secondary)
                                .padding(.leading, 25)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                // Botão de logout
                Button("Sair") {
                    showLogoutAlert = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .navigationTitle("Perfil")
            .alert("Sair do App", isPresented: $showLogoutAlert) {
                Button("Cancelar", role: .cancel) { }
                Button("Sair", role: .destructive) {
                    authManager.logout()
                }
            } message: {
                Text("Tem certeza que deseja sair?")
            }
        }
    }
}


#Preview {
    PerfilView()
}
