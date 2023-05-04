//
//  AlegeDoctor.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI

struct AlegeDoctor: View {
    @StateObject var manager = DBManager.shared
    @StateObject var programariManager = ProgramariManager.shared
    @State var doctori: [DoctorModel] = []
    @State var servicii: [ServiciuMedicalModel] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
    
                // DOCTORI
                Text("Alege un doctor").bold().foregroundColor(.black)
                ForEach(doctori.filter {$0.specialitate == programariManager.specialitate}) { doctor in
                    HStack {
                        Image("DoctorMale")
                            .resizable()
                            .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Dr. \(doctor.nume) \(doctor.prenume)")
                                    .bold()
                                    .foregroundColor(programariManager.doctor == doctor.id ? .white : .black)
                                HStack(spacing: 2) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(programariManager.doctor == doctor.id ? .white : .blue)
                                    Text("4.9 (3821 reviews)").foregroundColor(programariManager.doctor == doctor.id ? .white : .black)
                                }.font(.caption)
                                Text("Specialist \(doctor.titlu)").font(.footnote).foregroundColor(programariManager.doctor == doctor.id ? .white : .black)
                            }
                            Spacer()
                            Image(systemName: "checkmark").foregroundColor(.white)

                    }
                    .padding()
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity ,maxHeight: 100)
                    .padding(.trailing)
                    .fontDesign(.rounded)
                    .background(programariManager.doctor == doctor.id ? Color.blue : Color.white).cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                    )
                    .padding(.bottom)
                    .onTapGesture {
                        programariManager.doctor = doctor.id
                    }
                }

                // SERVICIU
                Text("Alege un serviciu").bold().foregroundColor(.black)
                ForEach(servicii.filter {$0.specialitate == programariManager.specialitate} ) { serviciu in
                    HStack {
                        Text(serviciu.nume).foregroundColor(programariManager.serviciu == serviciu.id ? .white : .black)
                        Spacer()
                        Text(serviciu.pret).bold().foregroundColor(programariManager.serviciu == serviciu.id ? .white : .black)
                        Image(systemName: "checkmark").foregroundColor(.white)

                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(programariManager.serviciu == serviciu.id ? Color.blue : .white).cornerRadius(10)
                    .onTapGesture {
                        programariManager.serviciu = serviciu.id
                    }
                }
                

                // BUTON
                NavigationLink {
                    AlegeData()
                }label:{
                    Text("Continua")
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
            .fontDesign(.rounded)
        }
        .task {
            await DBManager.shared.fetchDoctors2({ doctori in
                self.doctori = doctori
            })
            await DBManager.shared.fetchServices2({ servicii in
                self.servicii = servicii
            })
        }
        .navigationTitle("Alergologie")
        .navigationBarTitleDisplayMode(.inline)
        .background(.white)
    }
}

struct AlegeDoctor_Previews: PreviewProvider {
    static var previews: some View {
        AlegeDoctor()
    }
}
