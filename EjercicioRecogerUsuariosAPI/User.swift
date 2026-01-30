//
//  User.swift
//  RickMortyApp2
//
//  Created by Laura Perez  Martin on 28/1/26.
//

import Foundation

struct UserResponse: Codable{
    
    let code: Int
    let data: [UserDatos]


}


struct UserDatos:Codable, Identifiable{
    let id: Int?
    let name: String
    let email: String
    let gender: String
    let status: String
    let created_at: Date?
    let update_at: Date?
}
