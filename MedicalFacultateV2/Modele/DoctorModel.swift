//
//  DoctorModel.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation

struct DoctorModel : Codable, Identifiable {
    var id: String
    var nume: String
    var prenume: String
    var titlu: String
    var specialitate: String
}
