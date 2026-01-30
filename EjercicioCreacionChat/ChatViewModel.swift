//
//  ChatViewModel.swift
//  CreacionChat
//
//  Created by Laura Perez  Martin on 30/1/26.
//

import Foundation
import SwiftUI
import Combine

class ChatViewModel: ObservableObject {
    @Published var mensajes: [MensajeChat] = [
        MensajeChat(text: "Hola, ¿Cómo estás?", isUser: true),
        MensajeChat(text: "Muy bien, ¿Y tú?", isUser: false)
    ]

    func enviarMensaje(_ texto: String) {
        let limpio = texto.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !limpio.isEmpty else { return }

        mensajes.append(MensajeChat(text: limpio, isUser: true))

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.mensajes.append(MensajeChat(text: " \(limpio)", isUser: false))
        }
    }
}
