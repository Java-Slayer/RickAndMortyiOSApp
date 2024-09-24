//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by THL_Mac on 9/24/24.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
