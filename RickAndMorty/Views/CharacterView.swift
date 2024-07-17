//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 17.07.2024.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    var body: some View {
        HStack {
            //MARK: - Image
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } placeholder: {
                ZStack {
                    Color.gray
                    ProgressView()
                }
            }
            .frame(width: 84, height: 64)
            .cornerRadius(5)
            .padding(.leading, 10)
            //MARK: - Text
            VStack (alignment: .leading){
                Text(character.name)
                    .font(.semiBold, size: 18)
                
                HStack(spacing: 3) {
                    Text(character.status)
                        .font(.semiBold, size: 16)
                        .setStatusColor(character.status)
                    Text("• \(character.species)")
                        .font(.semiBold, size: 16)
                }
                
                Text(character.gender)
                    .font(.regular, size: 16)
            }
            .frame(height: 64)
            .foregroundStyle(.white)
            Spacer()
        }
        .padding(.vertical)
        .background(Color(0x151517))
        .cornerRadius(20)
        .frame(width: 353, height: 96)
    }
}

