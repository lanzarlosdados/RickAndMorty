//
//  CharacterDetailPresenter.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 24/07/2023.
//

import Foundation

protocol CharacterDetailViewProtocol : AnyObject{
    func getData(list : [[Any]],sectionTitleList : [String])
}
@MainActor
class CharacterDetailPresenter{
    
    private var provider : CharacterDetailProviderProtocol
    weak var delegate : CharacterDetailViewProtocol?
    private var dataVideos : [[Any]] = []
    private var sectionTitleList : [String] = []
    
    
    init(provider: CharacterDetailProviderProtocol = CharacterDetailProvider() , delegate: CharacterDetailViewProtocol) {
        self.provider = provider
        self.delegate = delegate
//        #if DEBUG
//        if MockManager.shared.runAppWithMock {
//            self.provider = HomeProviderMock()
//        }
//        #endif
    }
    
    func getCharacterById(id : String) async{
        dataVideos.removeAll()
        sectionTitleList.removeAll()
        
//        delegate?.loadingView(.show)
        
        async let character = try await provider.getCharacterById(characterId: id)
        
        do {
            
//            defer{
//                delegate?.loadingView(.hide)
//            }
            let (response) = await (try character)
            dataVideos.append([response])
            sectionTitleList.append("")

//            if let id = responsePlaylist.first?.id, let playlistItems = await getPlayListItem(playlistID: id){
//                dataVideos.append(playlistItems.items)
//                sectionTitleList.append(responsePlaylist.first?.snippet.title ?? "")
//            }
//
            if let episodes = await getEpisodesByIds(episodesIds: "1,2,3,4,5,6") {
                dataVideos.append(episodes)
                sectionTitleList.append("Episodes")
            }
            
        }catch{
            print("error",error)
        }
        
        delegate?.getData(list: dataVideos,sectionTitleList: sectionTitleList)
    }
    
    func getEpisodesByIds(episodesIds: String) async -> [Episode]?{
        do {
            let episodes = try await provider.getEpisodesByIds(episodeIds: episodesIds)
            return episodes
        }catch{
            print("error",error)
            return nil
        }
    }
}
