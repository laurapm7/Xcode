//
//  MensajeChat.swift
//  CreacionChat
//
//  Created by Laura Perez  Martin on 30/1/26.
//

import Foundation



struct MensajeChat: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
