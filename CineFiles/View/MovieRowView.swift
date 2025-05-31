// MovieRowView.swift
import SwiftUI

struct MovieRowView: View {
    let filme: Filme

    var body: some View {
        HStack(spacing: 16) {
            Image(filme.imagem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 120)
                .clipped()
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)

            VStack(alignment: .leading, spacing: 6) {
                Text(filme.titulo)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundStyle(.white)

                Text(filme.direcao)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundStyle(.white)

                Text("Ano: \(String(filme.ano))")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            Spacer()
        }
        .background(.azulFundo)
        .padding(.vertical, 10)
    }
}


