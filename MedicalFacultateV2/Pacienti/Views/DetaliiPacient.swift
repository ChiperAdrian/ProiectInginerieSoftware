//
//  DetaliiPacient.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

//struct DetaliiPacient: View {
//    @StateObject var manager = ProgramariManager.shared
//    @State var text = ""
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 0) {
//                SearchBarComponent(text: $text)
//                    .padding(.bottom, 40)
//                ForEach(DBManager.shared.pacienti) { pacient in
//                    HStack {
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Nume: \(pacient.nume) \(pacient.prenume)")
//                            Text("CNP: \(pacient.cnp)")
//                            Text("Email: \(pacient.email)")
//                            Text("Telefon: \(pacient.telefon)")
//                        }
//                        Spacer()
//                        Image(systemName: "checkmark").foregroundColor(.white)
//                    }
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(.gray, lineWidth: 1)
//                    )
//                    .onTapGesture {
//                        manager.pacient = pacient
//                    }
//                    .background(manager.pacient?.id ?? "" == pacient.id ? Color.blue.cornerRadius(12) : Color.white.cornerRadius(12))
//                    .padding(.bottom)
//                    .foregroundColor(manager.pacient?.id ?? "" == pacient.id ? .white : .black)
//                }
//                Button {
//                    DBManager.shared.adaugaProgramare(programare: ProgramareModel(id: UUID().uuidString, data: manager.data, doctor: manager.doctor, specialitate: manager.specialitate, serviciu: manager.serviciu, pacient: manager.pacient?.id ?? ""))
//                    manager.data = ""
//                    manager.specialitate = ""
//                    manager.doctor = ""
//                    manager.serviciu = ""
//                 
//                }label:{
//                    Text("Programeaza")
//                        .frame(maxWidth: .infinity, maxHeight: 30)
//                        .padding(.vertical, 10)
//                        .background(.blue)
//                        .cornerRadius(20)
//                        .foregroundColor(.white)
//                        .bold()
//                        .padding(.bottom)
//                }
//            }
//            .fontDesign(.rounded)
//            .bold()
//        .padding()
//        }
//        .navigationTitle("Detalii Pacient")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//struct DetaliiPacient_Previews: PreviewProvider {
//    static var previews: some View {
//        DetaliiPacient()
//    }
//}
//
//struct TextFieldComponent: View {
//    let sfSymbol: String
//    let placeholder: String
//    @Binding var text: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: sfSymbol).foregroundColor(.gray)
//            TextField(placeholder, text: $text)
//        }
//        .padding()
//        .background(Color(red: 249/255, green: 249/255, blue: 249/255))
//        .cornerRadius(10)
//    }
//}
