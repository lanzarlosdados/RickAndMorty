//
//  CharactersFavouriteViewModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/08/2023.
//

import Foundation
import Combine

final class CharactersFavouriteViewModel {
        
        var delegate : BaseViewProtocol?
        private let repository : CharactersFavouriteRepository
        var postObservable = PassthroughSubject<Void,Error>()
        var charactersFavourite : [CharacterFavourite] = []
        
        init(repository: CharactersFavouriteRepository = CharactersFavouriteRepository()) {
            self.repository = repository
        }
    
    func getCharactersFavourite(){
        delegate?.loadingView(.show)
        repository.getCharactersFavourite { result in
            switch result {
            case .success(let charactersFavourite):
                print(charactersFavourite as Any)
                self.charactersFavourite = charactersFavourite
                self.postObservable.send()
                self.delegate?.loadingView(.hide)
            case .failure(let error):
                self.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }
    }
    
    func addCharacterFavourite(characterFavourite: CharacterFavourite){
        delegate?.loadingView(.show)
        repository.addCharacterFavourite(characterFavourite: characterFavourite) { result in
            switch result {
            case .success(let charactersFavourite):
                print(charactersFavourite as Any)
                self.postObservable.send()
                self.delegate?.loadingView(.hide)
            case .failure(let error):
                self.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }
    }

}
