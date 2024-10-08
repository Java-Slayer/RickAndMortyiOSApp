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
    
    enum RMServiceError: Error {
        case failToCreateRequest
        case failToGetData
    }
    
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
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failToGetData))
                return
            }
            
//            Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
//    MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
