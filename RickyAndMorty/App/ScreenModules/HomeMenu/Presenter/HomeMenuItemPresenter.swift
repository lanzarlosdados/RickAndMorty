//
//  HomeMenuItemPresenter.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/07/2023.
//

import Foundation

protocol HomeMenuViewProtocol : AnyObject {
    func getData(menuItems : [MenuItem])
}

@MainActor
class HomeMenuItemPresenter {
    
    private var provider : HomeMenuItemProviderProtocol
    weak var delegate : HomeMenuViewProtocol?
    private var responseMenu : [MenuItem] = []
  
    
    init(provider: HomeMenuItemProviderProtocol = HomeMenuItemProvider() , delegate:HomeMenuViewProtocol) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getMenuItems() async {
        async let menuItems = try await provider.getMenuItems()

        do{
             let (response) = await (try menuItems)
            responseMenu = response.menuItems
        }catch{
            print("error",error)
        }
        delegate?.getData(menuItems: responseMenu)
    }
}
