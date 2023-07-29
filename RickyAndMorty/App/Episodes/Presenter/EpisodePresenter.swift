//
//  EpisodePresenter.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 23/07/2023.
//


import Foundation
 
protocol EpisodesViewProtocol : AnyObject, BaseViewProtocol {
    func getData(list : [Episode])
}

@MainActor
class EpisodesPresenter{
    
    private var provider : EpisodesProviderProtocol
    weak var delegate : EpisodesViewProtocol?
    private var data : [Episode] = []
    
    
    init(provider: EpisodesProviderProtocol = EpisodesProvider() , delegate: EpisodesViewProtocol) {
        self.provider = provider
        self.delegate = delegate
//        #if DEBUG
//        if MockManager.shared.runAppWithMock {
//            self.provider = HomeProviderMock()
//        }
//        #endif
    }
    
    func getEpisodes() async{
        delegate?.loadingView(.show)
        async let episodes = try await provider.getEpisodes().results
        
        do {
            defer{
                delegate?.loadingView(.hide)
            }
            let (response) = await (try episodes)
            data = response
        }catch{
            print("error",error)
        }
        
        delegate?.getData(list:data)
    }
    
}

