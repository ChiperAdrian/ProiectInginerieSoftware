//
//  PacientiAdaugaProgramare.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct PacientiAdaugaProgramare: View {
    @State var specializare = "Cardiologie"
    @StateObject var manager = ProgramariManager.shared
    @State var goToAlegeDoctor = false
    @State var specialitati: [SpecialitateModel] = []
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Alege specialitate")
                        .bold()
                    ForEach(specialitati) { specialitate in
                        HStack {
                            Text(specialitate.nume).foregroundColor(manager.specialitate == specialitate.id ? .white : .black)

                            Spacer()
                            Image(systemName: "checkmark").foregroundColor(.white)
                        }
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                        )
                        .background( manager.specialitate == specialitate.id ? Color.blue.cornerRadius(12) : Color.white.cornerRadius(12))
                        .padding(.bottom)
                        .onTapGesture {
                            print("S")
                            manager.specialitate = specialitate.id
                        }
                    }
 
                    NavigationLink {
                        AlegeDoctor()
                    }label: {
                        Text("Continua")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                }

                Spacer()
            }.padding()
        }
        .task {
            await DBManager.shared.fetchSpecialties2({ specialitati in
                self.specialitati = specialitati
            })
        }
        .navigationDestination(isPresented: $goToAlegeDoctor) {
            AlegeDoctor()
        }
    }
}

struct PacientiAdaugaProgramare_Previews: PreviewProvider {
    static var previews: some View {
        PacientiAdaugaProgramare()
    }
}
