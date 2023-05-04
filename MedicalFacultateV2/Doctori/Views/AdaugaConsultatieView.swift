//
//  AdaugaConsultatieView.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 04.05.2023.
//

import SwiftUI

struct AdaugaConsultatieView: View {
    var doctor: DoctorModel
    @State var data = Date.now
    @Environment(\.calendar) var calendar
    let dateFormatter = DateFormatter()
    @State var dates: Set<DateComponents> = []
    @State private var numarConsultatii = 1
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Alegeti date calendaristice")
                .foregroundColor(.blue)
                .bold()
                .font(.title2)
            DatePicker("Enter your birthday", selection: $data, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(maxHeight: 400)
            Text("Alegeti numarul de consultatii")
                .foregroundColor(.blue)
                .bold()
                .font(.title2)
            Stepper("Numar consultatii: \(numarConsultatii)", value: $numarConsultatii, in: 0...130)
                .padding(.bottom, 40)
            Button {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                let result = dateFormatter.string(from: data)
                print(result)
                DBManager.shared.adaugaConsultatieDoctor(doctorId: doctor.id, data: result, numarConsultatii: String(numarConsultatii)) {}
                dismiss()
            }label: {
                Text("Finalizeaza")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct AdaugaConsultatieView_Previews: PreviewProvider {
    static var previews: some View {
        AdaugaConsultatieView(doctor: DoctorModel(id: "", nume: "", prenume: "", titlu: "", specialitate: ""))
    }
}
