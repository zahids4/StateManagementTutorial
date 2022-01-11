//
//  Story.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-10.
//

import Foundation

struct StoryList: Decodable {
    let stories: [Story]
}

struct Story: Decodable, Identifiable {
    let id: String
    let title: String
    let cover: String
}
