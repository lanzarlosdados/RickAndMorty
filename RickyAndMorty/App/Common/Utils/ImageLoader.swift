//
//  ImageLoader.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 16/02/2025.
//
import SwiftUI
import SDWebImageSwiftUI

struct RemoteImage: View {
    let urlString: String
    let placeholder: Image?
    let errorImage: Image?
    
    var body: some View {
        WebImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            if let placeholder = placeholder {
                placeholder
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .onFailure { _ in
            // Manejo de errores
        }
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .scaledToFit()
        .clipped()
    }
}
