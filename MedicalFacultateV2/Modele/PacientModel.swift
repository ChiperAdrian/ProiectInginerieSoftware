//
//  PacientModel.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation

struct PacientModel: Codable, Identifiable {
    var id: String
    var nume: String
    var prenume: String
    var email: String
    var telefon: String
    var cnp: String
}
