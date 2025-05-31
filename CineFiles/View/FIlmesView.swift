// FilmesView.swift
import SwiftUI

struct FilmesView: View {
    @State var filmes: [Filme] = .filmes()
    @State var selectedFilmeID: UUID? = nil
    @State var Geral: String = "GERAL"
    @State var Mentoria: String = "LISTA MENTORIA JR"
    

    enum DisplayFilter: String, CaseIterable, Identifiable {
        case todos = "Todos"
        case favoritos = "Favoritos"
        case vistos = "Vistos"
        var id: String { self.rawValue }
    }
    @State private var activeFilter: DisplayFilter = .todos

    var nonMonitoriaFilmesFiltrados: [Filme] {
        let baseList = filmes.filter { !$0.isFilmeMonitoria }
        return aplicarFiltro(para: baseList)
    }

    var monitoriaFilmesFiltrados: [Filme] {
        let baseList = filmes.filter { $0.isFilmeMonitoria }
        return aplicarFiltro(para: baseList)
    }

    private func aplicarFiltro(para lista: [Filme]) -> [Filme] {
        switch activeFilter {
        case .todos:
            return lista
        case .favoritos:
            return lista.filter { $0.isFavorito }
        case .vistos:
            return lista.filter { $0.visto }
        }
    }
    
    private func bindingParaFilme(id: UUID) -> Binding<Filme> {
        guard let index = filmes.firstIndex(where: { $0.id == id }) else {
            fatalError("Filme com ID \(id) não encontrado para binding.")
        }
        return $filmes[index]
    }

    var body: some View {
        ZStack {
            // Background fixo para toda a tela
            Color.azulFundo
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header com logo centralizado e título à esquerda
                VStack(spacing: 10) {
                    // Logo centralizado
                    HStack {
                        Spacer()
                        Image("LogoH")
                            .resizable()
                            .frame(width: 153, height: 37)
                        Spacer()
                    }
                    
                    // Texto à esquerda
                    HStack {
                        Text("Filmes Disponíveis")
                            .foregroundStyle(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(.azulFundo)
                
                NavigationStack {
                    VStack(spacing: 0) {
                        Picker("Filtrar por:", selection: $activeFilter) {
                            ForEach(DisplayFilter.allCases) { filter in
                                Text(filter.rawValue).tag(filter)
                                    .foregroundColor(.white)
                            }
                        }
                        .colorMultiply(.azulAcoes)
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        .padding(.bottom, 15)
                        .background(.azulbb)
                        .cornerRadius(120)
                        
                        ScrollView {
                            LazyVStack(spacing: 0) {
                                if !nonMonitoriaFilmesFiltrados.isEmpty || activeFilter != .todos {
                                    SeccaoFilmesView(titulo: activeFilter == .todos ? Geral : "\(activeFilter.rawValue) (Geral)",
                                                     filmesParaMostrar: nonMonitoriaFilmesFiltrados,
                                                     selectedFilmeID: $selectedFilmeID)
                                }
                                
                                if !monitoriaFilmesFiltrados.isEmpty || activeFilter != .todos {
                                    SeccaoFilmesView(titulo: activeFilter == .todos ? Mentoria : "\(activeFilter.rawValue) (Monitoria)",
                                                     filmesParaMostrar: monitoriaFilmesFiltrados,
                                                     selectedFilmeID: $selectedFilmeID)
                                }
                                
                                if nonMonitoriaFilmesFiltrados.isEmpty && monitoriaFilmesFiltrados.isEmpty && activeFilter != .todos {
                                    ContentUnavailableView("Nenhum filme encontrado",
                                                           systemImage: activeFilter == .favoritos ? "heart.slash" : "eye.slash",
                                                           description: Text("Nenhum filme corresponde ao filtro \"\(activeFilter.rawValue)\"." )
                                    )
                                    .padding(.top, 50)
                                    .background(.azulFundo)
                                }
                            }
                        }
                        .background(.azulFundo)
                        .scrollContentBackground(.hidden)
                    }
                    .background(.azulFundo)
                    .sheet(item: $selectedFilmeID) { filmID in
                        FilmeDetailSheetContentView(filme: bindingParaFilme(id: filmID))
                    }
                }
            }
        }
    }
}

struct SeccaoFilmesView: View {
    let titulo: String
    let filmesParaMostrar: [Filme]
    @Binding var selectedFilmeID: UUID?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !filmesParaMostrar.isEmpty {
                Text(titulo)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .foregroundStyle(.white)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(filmesParaMostrar) { filme in
                            Button {
                                selectedFilmeID = filme.id
                            } label: {
                                VStack(spacing: 6) {
                                    Image(filme.imagem)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 110, height: 165)
                                        .clipped()
                                        .cornerRadius(8)
                                    Text(filme.titulo)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .lineLimit(1)
                                        .frame(width: 110)
                                        .foregroundStyle(.white)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
        .background(.azulCaixas)
    }
}

#Preview {
    FilmesView()
}
