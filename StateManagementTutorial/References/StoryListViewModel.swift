//
//  StoryListViewModel.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-11.
//

import Foundation

@MainActor class StoryListViewModel: ObservableObject {
    @Published var stories: [Story] = [] // TODO: Make a Story VM 
    private var webService: WebServicing
    
    init(webService: WebServicing) {
        self.webService = webService
    }
    
    func loadData() async {
        do {
           let data = await webService.fetchStories()
            switch data {
            case .success(let data):
                let decodedResponse = try JSONDecoder().decode(StoryList.self, from: data)
                stories = decodedResponse.stories
            case .failure(let error):
                print(error)
            }
        } catch {
            print("Invalid data")
        }
    }
}
