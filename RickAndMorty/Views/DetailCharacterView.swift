//
//  DetailCharacterView.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 19.07.2024.
//

import SwiftUI

struct DetailCharacterView: View {
    let character: Character
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            VStack {
                VStack {
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
                    .frame(width: 320, height: 320)
                    .cornerRadius(5)
                    //MARK: - Text
                    Text(character.status)
                        .font(.medium, size: 21)
                        .frame(width: 320, height: 42)
                        .foregroundStyle(.white)
                        .setBackgroundStatusColor(character.status)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Species : ")
                                .font(.medium, size: 16) +
                            Text(character.species)
                                .font(.regular, size: 16)
                            
                            Text("Gender: ")
                                .font(.medium, size: 16) +
                            Text(character.gender)
                                .font(.medium, size: 16)
                            
                            Text("Episodes: ")
                                .font(.medium, size: 16) +
                            Text(takeEpisodes(character.episode))
                                .font(.medium, size: 16)
                            
                            Text("Last known location: ")
                                .font(.medium, size: 16) +
                            Text(character.location.name)
                                .font(.medium, size: 16)
                        }
                        .foregroundStyle(.white)
                        Spacer()
                    }
                    .frame(width: 320)
                }
                .padding()
                .background(Color(0x151517))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        //MARK: - Setup backButton
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .bold()
                        .foregroundStyle(Color.white)
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, .zero)
            }
        }
    }
    //MARK: - Methods
    private func takeEpisodes(_ episodesArr: [String]) -> String {
        var episodesString = ""
        episodesArr.forEach { str in
            let episodeNumber = str.replacingOccurrences(of: "https://rickandmortyapi.com/api/episode/",with: " ")
            episodesString += episodeNumber + ","
        }
        episodesString.removeLast()
        return episodesString
    }
}

