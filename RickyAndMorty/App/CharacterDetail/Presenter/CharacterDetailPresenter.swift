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
//
//            dataVideos.append(responseVideos)
//            sectionTitleList.append("Uplooads")
            
        }catch{
            print("error",error)
        }
        
        delegate?.getData(list: dataVideos,sectionTitleList: sectionTitleList)
    }
    
//    func getPlayListItem(playlistID : String) async -> PlayListItemModel?{
//        do {
//            let playlistItems = try await provider.getPlaylistItems(playlistId: playlistID)
//            return playlistItems
//        }catch{
//            print("error",error)
//            return nil
//        }
//    }
}
