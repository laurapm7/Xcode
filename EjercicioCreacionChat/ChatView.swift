//
//  ChatView.swift
//  CreacionChat
//
//  Created by Laura Perez  Martin on 30/1/26.
//

import SwiftUI
import Combine

struct ChatView: View {

    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText = ""

    var body: some View {
        VStack {

            ScrollView {
                Text("Bienvenido a tu chat").font(.largeTitle).foregroundColor(.cyan)
                LazyVStack(spacing: 10) {
                    
                    ForEach(viewModel.mensajes) { mensaje in
                        FormatoChatView(mensaje: mensaje)
                    }
                }
            }

            Divider()

            HStack {
                TextField("Escribe tu mensaje...", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Enviar") {
                    guard !inputText.isEmpty else { return }
                    viewModel.enviarMensaje(inputText)
                    inputText = ""
                        
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
    
}
