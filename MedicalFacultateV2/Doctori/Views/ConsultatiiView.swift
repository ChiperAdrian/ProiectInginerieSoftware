//
//  ConsultatiiView.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 04.05.2023.
//

import SwiftUI

struct ConsultatiiView: View {
    var doctor: DoctorModel
    @State var consultatii: [ConsultatieModel] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Disponibilitate").bold().font(.title)
                    Spacer()
                }.padding(.bottom)
                ForEach(consultatii) { consultatie in
                    if consultatie.doctor == doctor.id {
                        VStack(alignment:.leading) {
                            Text("Data: **\(consultatie.date)**")
                            Text("Numar consultatii: **\(consultatie.numarConsultatii)**")
                        }
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 230/255, green: 230/255, blue: 230/255), lineWidth: 1)
                        )
                    }
                }
            }
        }
        .task {
            await DBManager.shared.fetchConsultatii2({ consultatii in
                consultatii.forEach { consultatie in
                    if consultatie.doctor == doctor.id {
                        self.consultatii.append(consultatie)
                    }
                }
            })
        }
        .onDisappear {
            consultatii = []
        }
        .padding()

    }
}

struct ConsultatiiView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultatiiView(doctor: DoctorModel(id: "", nume: "", prenume: "", titlu: "", specialitate: ""))
    }
}
