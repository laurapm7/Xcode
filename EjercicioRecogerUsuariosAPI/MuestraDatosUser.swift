//
//  MuestraDatosUser.swift
//  RickMortyApp2
//
//  Created by Laura Perez  Martin on 28/1/26.
//

import SwiftUI

struct MuestraDatosUser: View {
    @State var user: [UserDatos] = []
    
    var body: some View {
        NavigationStack{
            
            List(user){ usuarios in
                
                HStack{
                    Text(usuarios.name).bold().foregroundColor(.brown).alignmentGuide(HorizontalAlignment.leading){_ in 2}
                    Text(usuarios.email).padding(20).alignmentGuide(HorizontalAlignment.center){_ in 2}
                    Text(usuarios.gender).alignmentGuide(HorizontalAlignment.center){_ in 2}.padding(10)
                    
                    if let date = usuarios.created_at {
                        Text(date.formatted(date: .abbreviated, time: .omitted))
                    }else{
                        Text("No hay fecha").foregroundColor(.red)
                    }
                    
                }.padding(5)
                
            }
        }
        
        .task {
            do{
                user = try await NetworkingProvider().obtenerUsuarios().data
                print(user)
                
            }catch{
                print("Error: \(error)")
            }
        }
    }
}


#Preview {
    MuestraDatosUser(user:[])
}
