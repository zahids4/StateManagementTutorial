//
//  WebService.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-10.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
}

protocol WebServicing {
    func fetchStories() async -> Result<Data, NetworkError>
}

class WebService: WebServicing {
    func fetchStories() async -> Result<Data, NetworkError> {
        guard let storiesURL = Endpoint.storiesEndpoint().url else {
            return .failure(.invalidURL)
        }
        
        return await getRequest(withURL: storiesURL)
    }
}

extension WebService {
    func getRequest(withURL url: URL) async -> Result<Data, NetworkError> {        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return .success(data)
        } catch {
            return .failure(.invalidData)
        }
    }
}
