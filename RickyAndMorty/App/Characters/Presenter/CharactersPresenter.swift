//
//  CharactersPresenter.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import Foundation
 
protocol CharactersViewProtocol : AnyObject, BaseViewProtocol {
    func getData(list : [Character])
}

@MainActor
class CharactersPresenter{
    
    private var provider : CharactersProviderProtocol
    weak var delegate : CharactersViewProtocol?
    private var data : [Character] = []
    
    
    init(provider: CharactersProviderProtocol = CharactersProvider() , delegate: CharactersViewProtocol) {
        self.provider = provider
        self.delegate = delegate
//        #if DEBUG
//        if MockManager.shared.runAppWithMock {
//            self.provider = HomeProviderMock()
//        }
//        #endif
    }
    
    func getCharacters() async{
        
        delegate?.loadingView(.show)
        async let characters = try await provider.getAllCharacters().results
        do {
            defer{
                delegate?.loadingView(.hide)
            }
            let (response) = await (try characters)
            data = response
        }catch{
            print("error",error)
        }
        
        delegate?.getData(list:data)
    }
    
}
