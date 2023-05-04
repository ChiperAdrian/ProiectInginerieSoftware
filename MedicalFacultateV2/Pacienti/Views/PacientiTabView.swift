//
//  PacientiTabView.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct PacientiTabView: View {
    @State private var selectieProgramari = 0
    @State var text = ""
    @State var showAdaugaPacient = false
    @State var nume: String = ""
    @State var prenume = ""
    @State var email = ""
    @State var telefon = ""
    @State var cnp = ""
    @State var goToAdaugaProgramare = false
    @State var pacienti: [PacientModel] = []
    
    var body: some View {
        ScrollView {
            VStack {
                SearchBarComponent(text: $text).padding(.bottom)
                HStack {
                    Spacer()
                    Button {
                        showAdaugaPacient = true
                    }label: {
                        Text("+ Adauga pacient")
                            .padding(10)
                            .foregroundColor(.white)
                            .bold()
                            .background(.blue)
                            .cornerRadius(12)
                            .padding(.bottom)
                    }
                    .sheet(isPresented: $showAdaugaPacient) {
                        VStack {
                            Text("Adauga pacient")
                                .foregroundColor(.blue)
                                .bold()
                                .font(.title2)
                                .padding(.top)
                            TextField("Nume", text: $nume)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                                )
                            TextField("Prenume", text: $prenume)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                                )
                            TextField("CNP", text: $cnp)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                                )
                            TextField("Email", text: $email)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                                )
                            TextField("Telefon", text: $telefon)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                                )
                            Button {
                                DBManager.shared.adaugaPacient(pacient: PacientModel(id: UUID().uuidString, nume: nume, prenume: prenume, email: email, telefon: telefon, cnp: cnp)) {}
                                nume = ""
                                prenume = ""
                                email = ""
                                telefon = ""
                                cnp = ""
                                showAdaugaPacient = false
                            }label: {
                                Text("Adauga")
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(.blue)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            Spacer()
                        }
                        .presentationDetents([.medium])
                        .padding()
                    }
                }

                ForEach(pacienti) { pacient in
                    VStack(alignment:.leading) {
                        HStack {
                            Text("**\(pacient.nume) \(pacient.prenume)**").font(.title3)

                            Spacer()
                            NavigationLink {
                                PacientiProgramari(pacient: pacient)
                            }label: {
                                Text("Programari")
                                    .padding(10)
                                    .font(.footnote)
                                    .background(.blue)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            Button {
                                ProgramariManager.shared.pacient = pacient
                                goToAdaugaProgramare = true
                            }label: {
                                Text("+ Programare")
                                    .padding(10)
                                    .font(.footnote)
                                    .background(.blue)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        Text("CNP: **\(pacient.cnp)**")
                        Text("Telefon: **\(pacient.telefon)**")
                        Text("Email: **\(pacient.email)**")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                    )
                }
                

            }.padding()
        }
        .task {
            await DBManager.shared.fetchPacienti2 { pacienti in
                self.pacienti = pacienti
            }
        }
        .navigationDestination(isPresented: $goToAdaugaProgramare) {
            PacientiAdaugaProgramare()
        }
    }
}

struct PacientiTabView_Previews: PreviewProvider {
    static var previews: some View {
        PacientiTabView()
    }
}
