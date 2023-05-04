//
//  DoctorProgramari.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct DoctorProgramari: View {
    @State private var selectieProgramari = 0
    @State var text = ""
    var doctorId: String
    @State var programari: [ProgramareModel] = []
    @State var servicii: [ServiciuMedicalModel] = []
    @State var pacienti: [PacientModel] = []
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Consultatii")
                    .font(.title)
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            Picker("", selection: $selectieProgramari) {
                Text("Consultatii de efectuat").tag(0)
                Text("Istorie consultatii").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            .padding(.horizontal)
            VStack(alignment: .leading) {
                SearchBarComponent(text: $text) // cauta dupa data
                    .padding(.bottom)
                // TIPARESTE COSNULTATII
//                HStack {
//                    Spacer()
//                    Text("Tipareste programari")
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .bold()
//                        .background(.blue)
//                        .cornerRadius(12)
//                }.padding(.bottom)
                ForEach(programari) { programare in
                    if programare.doctor == doctorId {
                        if selectieProgramari == 0 {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Data: **\(programare.data)**")
                                    Spacer()
                                    Button {
                                        
                                    }label: {
                                        Text("Anuleaza")
                                            .padding(5)
                                            .background(.red)
                                            .cornerRadius(8)
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.footnote)
                                    }
                                    Button {
                                        
                                    }label: {
                                        Text("Finalizeaza")
                                            .padding(5)
                                            .background(.green)
                                            .cornerRadius(8)
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.footnote)
                                    }
                                }
                                Text("Serviciu: **\(servicii.first(where: {$0.id == programare.serviciu})?.nume ?? "")**")
                                Text("Pacient: ")
                                +
                                Text(pacienti.first(where: {$0.id == programare.pacient})?.nume ?? "").bold()
                                +
                                Text(" ")
                                +
                                Text(pacienti.first(where: {$0.id == programare.pacient})?.prenume ?? "").bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                            )
                        }
                        else {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Data: **\(programare.data)**")
                                    Spacer()
                                    Button {
                                        
                                    }label: {
                                        Text("Tipareste")
                                            .padding(5)
                                            .background(.blue)
                                            .cornerRadius(8)
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.footnote)
                                    }
                                    Button {
                                        
                                    }label: {
                                        Text("Emite factura")
                                            .padding(5)
                                            .background(.blue)
                                            .cornerRadius(8)
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.footnote)
                                    }
                                }
                                Text("Serviciu: **\(servicii.first(where: {$0.id == programare.serviciu})?.nume ?? "")**")
                                Text("Pacient: ")
                                +
                                Text(pacienti.first(where: {$0.id == programare.pacient})?.nume ?? "").bold()
                                +
                                Text(" ")
                                +
                                Text(pacienti.first(where: {$0.id == programare.pacient})?.prenume ?? "").bold()
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                            )
                        }
                    }
                }
            }.padding()
        }
        .task {
            await DBManager.shared.fetchProgramari2({ programari in
                self.programari = programari
            })
            await DBManager.shared.fetchServices2({ servicii in
                self.servicii = servicii
            })
            await DBManager.shared.fetchPacienti2({ pacienti in
                self.pacienti = pacienti
            })
        }
    }
}

struct DoctorProgramari_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProgramari(doctorId: "")
    }
}
