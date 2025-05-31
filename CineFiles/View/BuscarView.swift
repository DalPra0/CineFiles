// BuscarView.swift
import SwiftUI

extension UUID: @retroactive Identifiable {
    public var id: UUID {
        // Para um UUID, o seu próprio valor é o seu identificador único.
        return self
    }
}

struct BuscarView: View {
    @State private var searchText: String = ""
    @State private var allFilmes: [Filme] = .filmes()
    @State private var randomRecommendations: [Filme] = []
    @State private var selectedFilmeID: UUID? = nil
    @FocusState private var isSearchFieldFocused: Bool

    var searchResults: [Filme] {
        if searchText.isEmpty { return [] }
        return allFilmes.filter { $0.titulo.localizedCaseInsensitiveContains(searchText) }
    }
    
    private func bindingParaFilme(id: UUID) -> Binding<Filme> {
        guard let index = allFilmes.firstIndex(where: { $0.id == id }) else {
            fatalError("Filme com ID \(id) não encontrado para binding em allFilmes.")
        }
        return $allFilmes[index]
    }
    
    private func getUpdatedRecommendedFilmes() -> [Filme] {
        return randomRecommendations.map { recommendedFilme in
            allFilmes.first { $0.id == recommendedFilme.id } ?? recommendedFilme
        }
    }

    var body: some View {

        NavigationStack {
            VStack(spacing: 0) {
                Text ("Buscar")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .foregroundStyle(.white)
                
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Pesquisar filmes...", text: $searchText)
                        .textFieldStyle(.plain).focused($isSearchFieldFocused).padding(.vertical, 10)
                    if !searchText.isEmpty {
                        Button { searchText = "" } label: {
                            Image(systemName: "multiply.circle.fill").foregroundColor(.gray)
                        }.padding(.trailing, 8)
                    }
                }
                .padding(.horizontal).background(Color(.systemGray6)).cornerRadius(12)
                .padding(.horizontal).padding(.top, 5).padding(.bottom, 10)

                if searchText.isEmpty && !isSearchFieldFocused {
                    let currentRecommendations = getUpdatedRecommendedFilmes()
                    if !currentRecommendations.isEmpty {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Recomendações Para Você")
                                .font(.title2).fontWeight(.bold)
                                .padding([.horizontal, .top]).padding(.bottom, 12)
                                .foregroundStyle(.white)
                            ScrollView {
                                VStack(spacing: 0) {
                                    ForEach(currentRecommendations) { filme in
                                        MovieRowView(filme: filme)
                                            .padding(.horizontal)
                                            .contentShape(Rectangle())
                                            .onTapGesture { self.selectedFilmeID = filme.id }
                                        if filme.id != currentRecommendations.last?.id { Divider().padding(.leading) }
                                    }
                                }
                                .padding(.bottom)
                            }
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.95, anchor: .top)))
                    } else { /* ProgressView ou mensagem */ }
                } else { // Resultados da busca
                    if !searchText.isEmpty {
                        if searchResults.isEmpty {
                            ContentUnavailableView("Nenhum Filme Encontrado", systemImage: "film.slash", description: Text("Tente uma busca diferente."))
                                .transition(.opacity)
                        } else {
                            List(searchResults) { filme in
                                MovieRowView(filme: filme)
                                    .contentShape(Rectangle())
                                    .onTapGesture { self.selectedFilmeID = filme.id }
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    .padding(.horizontal)
                            }
                            .listStyle(.plain)
                            .transition(.opacity.combined(with: .scale(scale: 0.95, anchor: .top)))
                        }
                    } else { Spacer() }
                }
            }
            .background(.azulFundo)
            .onAppear {
                if randomRecommendations.isEmpty {
                    self.randomRecommendations = Array(allFilmes.shuffled().prefix(3))
                }
            }
            .sheet(item: $selectedFilmeID) { filmID in
                FilmeDetailSheetContentView(filme: bindingParaFilme(id: filmID))
            }
            .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0), value: searchText.isEmpty && !isSearchFieldFocused)
            .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0), value: isSearchFieldFocused)
            .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0), value: searchText)
        }
    }
}

#Preview { BuscarView() }
