//
//  NetworkingProvider.swift
//  RickMortyApp2
//
//  Created by Laura Perez  Martin on 28/1/26.
//

import Foundation

final class NetworkingProvider{
    
    static let shared = NetworkingProvider()
    
    func obtenerUsuarios() async throws -> (UserResponse){
        
        guard let url = URL(string: "https://gorest.co.in/public-api/users") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
       
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decoded = try decoder.decode(UserResponse.self, from: data)
            return decoded
            
        }catch{
            print("Error: \(error)")
            throw error
        }
        
        
        
        
    }
    
   
    
    
    
}
