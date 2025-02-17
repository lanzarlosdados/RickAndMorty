//
//  CharactersView.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 16/02/2025.
//

import SwiftUI

struct CharactersView: View {
    var character: Character
    
    var body: some View {
        VStack(spacing: 0) {
            RemoteImage(
                urlString: character.image,
                placeholder: Image("default"),
                errorImage: Image(systemName: "xmark.circle")
            )
            .scaledToFill()
            .frame(height: 170)
            .clipShape(
                UnevenRoundedRectangle(
                    cornerRadii: .init(
                        topLeading: 8,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 8
                    )
                )
            )
            
            Text(character.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 2)
    }
}
