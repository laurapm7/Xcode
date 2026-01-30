//
//  Prueba.swift
//  RickMortyApp
//
//  Created by Laura Perez  Martin on 27/1/26.
//

import SwiftUI

struct Prueba: View {
    
    @State  var personajes: [Character] = []
    var body: some View {
        
        NavigationStack{
            
            List(personajes, id: \.id) { personaje in
               
                HStack {
                               AsyncImage(url: URL(string: personaje.image)) { image in
                                   image
                                       .resizable()
                                       .scaledToFit()
                               } placeholder: {
                                   ProgressView()
                               }
                               .frame(width: 60, height: 60)
                               .clipShape(Rectangle())
                               
                               Text(personaje.name)
                               Text(personaje.gender).foregroundColor(.red)
                               Text(personaje.species)
                        .font(.callout)
                        .padding(10).foregroundColor(.cyan)
                           }
                           
                       }
            }
            .task {
                
                do{
                    personajes = try await APIPersonaje().obtenerPersonajes().0.results
                    
                }catch{
                    personajes = []
                }
                
            }
                
            
        }
           
         
        
        
    }
    


struct Personaje{
    let id: Int
    let name: String
}


#Preview {
    Prueba(personajes: [])
}
