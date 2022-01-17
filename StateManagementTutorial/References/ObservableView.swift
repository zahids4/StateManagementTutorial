//
//  ObservableView.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-07.
//

import SwiftUI
import WebService

struct ObservableView: View {
    @ObservedObject var resultListViewModel: StoryListViewModel
    
    var body: some View {
        NavigationView {
            List(resultListViewModel.stories) { story in
                HStack {
                    AsyncImage(
                        url: URL(string: story.cover)!,
                                transaction: Transaction(animation: .easeInOut)
                            ) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .transition(.scale(scale: 0.1, anchor: .center))
                                case .failure:
                                    Image(systemName: "wifi.slash")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 44, height: 44)
                            .background(Color.gray)
                            .clipShape(Circle())
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
        ObservableView(resultListViewModel: StoryListViewModel(webService: WebServiceProvider()))
    }
}
