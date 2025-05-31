// FilmeDetailSheetContentView.swift
import SwiftUI

struct FilmeDetailSheetContentView: View {
    @Binding var filme: Filme
    var body: some View {
        ZStack {
            // Background azul para toda a tela
            Color.azulFundo
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Image(filme.imagem)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 10)

                    Text(filme.titulo)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity, alignment: .center)

                    HStack(spacing: 20) {
                        Spacer()
                        Button {
                            filme.visto.toggle()
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: filme.visto ? "eye.slash.fill" : "eye.fill")
                                    .font(.title2)
                                    .foregroundColor(filme.visto ? .gray : .green)
                                Text(filme.visto ? "Não Visto" : "Marcar Visto")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(.azulCaixas)
                        .cornerRadius(10)

                        Button {
                            filme.isFavorito.toggle()
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: filme.isFavorito ? "heart.slash.fill" : "heart.fill")
                                    .font(.title2)
                                    .foregroundColor(filme.isFavorito ? .gray : .pink)
                                Text(filme.isFavorito ? "Desfavoritar" : "Favoritar")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(.azulCaixas)
                        .cornerRadius(10)
                        Spacer()
                    }
                    .padding(.vertical, 10)

                    Divider()
                        .background(.white.opacity(0.3))
                        .padding(.bottom, 8)

                    Group {
                        InfoLinha(label: "Direção", value: filme.direcao)
                        InfoLinha(label: "Roteiristas", value: filme.roteiristas)
                        InfoLinha(label: "Ano", value: String(filme.ano))
                    }
                    .font(.headline)

                    Divider()
                        .background(.white.opacity(0.3))
                        .padding(.vertical, 8)

                    VStack(alignment: .leading) {
                        Text("Sinopse:")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 4)
                        Text(filme.sinopse)
                            .font(.body)
                            .foregroundColor(.white)
                            .lineSpacing(5)
                    }
                    Spacer()
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct InfoLinha: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text("\(label):")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))
            Text(value)
                .foregroundColor(.white)
                .lineLimit(2)
        }
    }
}
