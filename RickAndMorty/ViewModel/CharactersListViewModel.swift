//
//  CharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 19.07.2024.
//

import SwiftUI
import Combine

class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    private var nextURL: String? = "https://rickandmortyapi.com/api/character/?page=1"
    private var cancellables = Set<AnyCancellable>()
    
    func loadCharacters() {
        guard !isLoading else { return }
        guard nextURL != nil else {
            isLoading = true
            return
        }
        
        isLoading = true
        
        guard let url = URL(string: nextURL!) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.nextURL = response.info.next
                    self.characters.append(contentsOf: response.results)
                }
            })
            .store(in: &cancellables)
    }
}
