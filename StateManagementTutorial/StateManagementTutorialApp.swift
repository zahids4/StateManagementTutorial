//
//  StateManagementTutorialApp.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-07.
//

import SwiftUI

@main
struct StateManagementTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ObservableView(resultListViewModel: StoryListViewModel(webService: WebService()))
        }
    }
}
