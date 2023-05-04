//
//  PacientiProgramari.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct PacientiProgramari: View {
    @State private var selectieProgramari = 0
    var pacient: PacientModel
    @State var programari: [ProgramareModel] = []
    @State var doctori: [DoctorModel] = []
    @State var servicii: [ServiciuMedicalModel] = []
    @State var specialitati: [SpecialitateModel] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Programari")
                    .font(.title)
                    .bold()

                Picker("", selection: $selectieProgramari) {
                    Text("Programari curente").tag(0)
                    Text("Istorie programari").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                // TIPARESTE COSNULTATII NUMAI LA ISTORIC
                ForEach(programari) { programare in
                    if programare.pacient == pacient.id {
                        if selectieProgramari == 0 {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Data: **\(programare.data)**")
                                    Spacer()
                                    Text("In curs")
                                        .foregroundColor(.blue)
                                        .font(.footnote)
                                        .bold()
                                }
                                Text("Doctor: **\(doctori.first(where: {$0.id == programare.doctor})?.nume ?? "")** **\(doctori.first(where: {$0.id == programare.doctor})?.prenume ?? "")**")
                                
                                Text("Specialitate: **\(specialitati.first(where: {$0.id == programare.specialitate})?.nume ?? "")**")
                                
                                Text("Serviciu: **\(servicii.first(where: {$0.id == programare.serviciu})?.nume ?? "")**")
                                Button {
                                    DBManager.shared.anuleazaProgramare(programare: programare){}
                                }label: {
                                    Text("Anuleaza programare")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .padding(7)
                                        .bold()
                                        .background(.blue)
                                        .cornerRadius(12)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                            )
                        }
                        else {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Data: **\(programare.data)**")
                                    Spacer()
                                    Text("Tipareste")
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .bold()
                                        .padding(5)
                                        .background(.blue)
                                        .cornerRadius(5)
                                    
                                }
                                Text("Doctor: **\(doctori.first(where: {$0.id == programare.doctor})?.nume ?? "")** **\(doctori.first(where: {$0.id == programare.doctor})?.prenume ?? "")**")
                                
                                Text("Specialitate: **\(specialitati.first(where: {$0.id == programare.specialitate})?.nume ?? "")**")
                                
                                Text("Serviciu: **\(servicii.first(where: {$0.id == programare.serviciu})?.nume ?? "")**")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                            )
                        }
                    }
                }
                

                
                // PROGRAMARE CURENTA
  

            }.padding()
                .presentationDetents([.large])
        }
        .task {
            await DBManager.shared.fetchProgramari2({ programari in
                self.programari = programari
            })
            await DBManager.shared.fetchDoctors2({ doctori in
                self.doctori = doctori
            })
            await DBManager.shared.fetchServices2({ servicii in
                self.servicii = servicii
            })
            await DBManager.shared.fetchSpecialties2({ specialitati in
                self.specialitati = specialitati
            })
        }
    }
}

struct PacientiProgramari_Previews: PreviewProvider {
    static var previews: some View {
        PacientiProgramari(pacient: PacientModel(id: "", nume: "", prenume: "", email: "", telefon: "", cnp: ""))
    }
}
