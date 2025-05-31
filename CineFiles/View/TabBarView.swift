import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            BuscarView()
                .tabItem { EmptyView() }
                .tag(0)

            FilmesView()
                .tabItem { EmptyView() }
                .tag(1)

            PerfilView()
                .tabItem { EmptyView() }
                .tag(2)
        }
        .overlay(
            CustomTabBar(selectedTab: $selectedTab)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.horizontal, 20)
//                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                .ignoresSafeArea(),

            alignment: .bottom  
        )
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(
                icon: "magnifyingglass",
                title: "Buscar",
                isSelected: selectedTab == 0,
                isBlueBackground: selectedTab == 0
            ) { selectedTab = 0 }

            Spacer()

            TabBarButton(
                icon: "movieclapper",
                title: "Filmes",
                isSelected: selectedTab == 1,
                isBlueBackground: selectedTab == 1
            ) { selectedTab = 1 }

            Spacer()

            TabBarButton(
                icon: "person.fill",
                title: "Perfil",
                isSelected: selectedTab == 2,
                isBlueBackground: selectedTab == 2
            ) { selectedTab = 2 }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
        )
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let isBlueBackground: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                ZStack {
                    if isBlueBackground {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue)
                            .frame(width: 58, height: 38)
                            .transition(.scale)
                    }
                    
                    Image(systemName: icon)
                        .font(.system(size: isBlueBackground ? 20 : 22, weight: .medium))
                        .foregroundColor(.white)
                }
                .frame(height: 38)

                if isBlueBackground {
                    Text(title)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white)
                        .transition(.opacity.combined(with: .offset(y: 5)))
                }
            }
            .frame(width: 70)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TabBarView()
}
