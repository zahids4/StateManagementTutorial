//
//  ObservableView.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-07.
//

import SwiftUI

struct ObservableView: View {
    @ObservedObject var resultListViewModel: StoryListViewModel
    
    var body: some View {
        NavigationView {
            List(resultListViewModel.stories) { story in
                HStack {
                    AsyncImage(url:  URL(string: story.cover)!)
                        .frame(minHeight: 50, maxHeight: 50)
                                        .aspectRatio(2 / 3, contentMode: .fit)
                    Text(story.title)
                        .font(.headline)
                }
            }.task {
                await resultListViewModel.loadData()
            }.refreshable {
                await resultListViewModel.loadData()
            }
            .navigationTitle("Stories")
        }
    }
}

struct Observable_Previews: PreviewProvider {
    static var previews: some View {
        ObservableView(resultListViewModel: StoryListViewModel(webService: WebService()))
    }
}
