//
//  RMService.swift
//  RickAndMorty
//
//  Created by THL_Mac on 9/24/24.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized contructor
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    ///   - type: The type of object we expect to get back
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type : T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
