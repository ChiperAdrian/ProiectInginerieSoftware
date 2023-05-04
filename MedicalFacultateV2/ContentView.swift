//
//  ContentView.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DoctoriTabView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Doctori")
            }
            NavigationStack {
                PacientiTabView()
            }
            .tabItem {
                Image(systemName: "person.3")
                Text("Pacienti")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
