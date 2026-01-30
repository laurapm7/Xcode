//
//  FormatoChatView.swift
//  CreacionChat
//
//  Created by Laura Perez  Martin on 30/1/26.
//

import SwiftUI


struct FormatoChatView: View {
    let mensaje: MensajeChat
    
    
    var body: some View {
       
            HStack {
                
                if mensaje.isUser {
                    Spacer()
                    
                    HStack {
                        Text(mensaje.text)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.black).font(.headline)
                            .cornerRadius(10)
                        
                        Image(systemName: "person.fill").font(.system(size: 25))
                    }
                    
                } else {
                    HStack {
                        Image(systemName: "bubble.left.fill").font(.system(size: 20))
                        
                        Text(mensaje.text)
                            .padding()
                            .background(.gray)
                            .cornerRadius(12)
                            .bold().font(.headline)
                        Spacer()
                    }
                    
                }
                
            }
            .padding()
        }
        
    }
    
    struct FormatoChatPantalla: View {
        @State private var inputText = ""
        
        var body: some View {
            VStack(spacing: 0) {
        
                    Text("Bienvenido a tu chat").font(.largeTitle).foregroundColor(.cyan)
                
                ScrollView {
                    VStack(spacing: 12) {
                        FormatoChatView(mensaje: MensajeChat(text: "Hola, ¿Cómo estás?", isUser: true))
                        FormatoChatView(mensaje: MensajeChat(text: "Muy bien, ¿Y tú?", isUser: false))
                    }
                    .padding()
                }
                
                HStack(spacing: 15) {
                    TextField("Escribe tu mensaje....",text: $inputText)
                        .textFieldStyle(.roundedBorder).font(.headline)
                    
                    Button("Enviar") {
                    }
                    .buttonStyle(.glass).foregroundColor(.cyan).font(.headline)
                }
                .padding()
            }
        }
    }



#Preview {
    FormatoChatPantalla()
   
}


