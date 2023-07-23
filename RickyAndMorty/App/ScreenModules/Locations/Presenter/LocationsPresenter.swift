//
//  LocationsPresenter.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 23/07/2023.
//

protocol LocationsViewProtocol : AnyObject {
    func getData(list : [Location])
}

@MainActor
class LocationsPresenter{
    
    private var provider : LocationsProviderProtocol
    weak var delegate : LocationsViewProtocol?
    private var data : [Location] = []
    
    
    init(provider: LocationsProviderProtocol = LocationsProvider() , delegate: LocationsViewProtocol) {
        self.provider = provider
        self.delegate = delegate
//        #if DEBUG
//        if MockManager.shared.runAppWithMock {
//            self.provider = HomeProviderMock()
//        }
//        #endif
    }
    
    func getLocations() async{
        
        async let locations = try await provider.getLocations().results
        
        do {
            let (response) = await (try locations)
            data = response
        }catch{
            print("error",error)
        }
        
        delegate?.getData(list:data)
    }
    
}
