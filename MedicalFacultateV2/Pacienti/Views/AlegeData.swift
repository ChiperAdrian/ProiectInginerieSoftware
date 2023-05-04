//
//  AlegeData.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct AlegeData: View {
    var selectedDoctor: String = ""
    var selectedService: String = ""
    @StateObject var programariManager = ProgramariManager.shared
    @State var consultatii: [ConsultatieModel] = []

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var selectedDay = 23
    var disabledDays = [4,5,11,12,18,19,25,26,7,16,27,13]
    @State var selectedHour = 14
    var disabledHours = [11,15,16]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Alege o data")
                    .bold()
                    .font(.title2)
                    .padding(.bottom)
                ForEach(consultatii.filter {$0.doctor == programariManager.doctor && Int($0.numarConsultatii) ?? 0 > 0 }) { consultatie in
                    HStack {
                        Text(consultatie.date)
                        Spacer()
                        Image(systemName: "checkmark").foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                    )
                    .foregroundColor(programariManager.data == consultatie.date ? .white : .black)
                    .background(programariManager.data == consultatie.date ? Color.blue.cornerRadius(12) : Color.white.cornerRadius(12))
                    .padding(.bottom)
                    .onTapGesture {
                        programariManager.data = consultatie.date
                        programariManager.consultatie = consultatie
                    }
                }
                

                // BUTON
                Button {
                    DBManager.shared.adaugaProgramare(programare: ProgramareModel(id: UUID().uuidString, data: programariManager.data, doctor: programariManager.doctor, specialitate: programariManager.specialitate, serviciu: programariManager.serviciu, pacient: programariManager.pacient?.id ?? "")) {}
                    DBManager.shared.decrementeazaNumarConsultatii(consultatie: programariManager.consultatie ?? ConsultatieModel(id: "", doctor: "", date: "", numarConsultatii: "")) {}
                    programariManager.data = ""
                    programariManager.specialitate = ""
                    programariManager.doctor = ""
                    programariManager.serviciu = ""
                    programariManager.pacient = nil
                    programariManager.consultatie = nil
                }label:{
                    Text("Rezerva")
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom)
                }
            }

        .padding()
        }
        .task {
            await DBManager.shared.fetchConsultatii2({ consultatii in
                self.consultatii = consultatii
            })
        }
        .navigationTitle("Programare")
        .navigationBarTitleDisplayMode(.inline)
        .background(.white)
    }
}

struct AlegeData_Previews: PreviewProvider {
    static var previews: some View {
        AlegeData()
    }
}
