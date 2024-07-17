//
//  CharactersList.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 19.07.2024.
//

import SwiftUI

struct CharactersList: View {
    @StateObject var charactersData = CharactersListViewModel()
    @State var columns = Array(repeating: GridItem(.flexible()), count: 1)
    @State var isLoading = true
    //MARK: - Setup UINavigationBarAppearance
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "IBMPlexSans-Bold", size: 24) ?? UIFont.self
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
       
        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
    }
    //MARK: - Character List
    var body: some View {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: self.columns, spacing: 10) {
                        ForEach(charactersData.characters, id: \.id) { character in
                            NavigationLink(destination: DetailCharacterView(character: character)) {
                                CharacterView(character: character)
                            }
                        }
                        if !charactersData.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .colorInvert()
                                .scaleEffect(2)
                                .padding()
                                .onAppear {
                                    if !charactersData.isLoading {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                            charactersData.loadCharacters()
                                        }
                                    }
                                }
                        }
                    }
                    .navigationTitle("Rick & Morty Characters")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .background(.black)
            }
        .onAppear {
            if isLoading {
                charactersData.loadCharacters()
            }
            isLoading = false
        }
    }
}

