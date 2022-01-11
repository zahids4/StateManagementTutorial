//
//  AsyncImage.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-11.
//

import Foundation
import SwiftUI

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader
    
    init(url: URL) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
    }
}
