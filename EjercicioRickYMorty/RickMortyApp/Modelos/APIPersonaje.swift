//
//  APIPersonaje.swift
//  RickMortyApp
//
//  Created by Laura Perez  Martin on 27/1/26.
//

import Foundation

class APIPersonaje{

        func obtenerPersonajes() async throws -> (RespuestaPersonajes) {
      
            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
                        throw URLError(.badURL)
                    }
            
            let (data, _) = try await URLSession.shared.data(from: url)

                    do {
                        let decoded = try JSONDecoder().decode(RespuestaPersonajes.self, from: data)
                        return decoded
                    } catch {
                        print("error: \(error)")
                        throw error
                    }
        }
}

