//
//  ServiciuMedicalModel.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//


import Foundation
struct ServiciuMedicalModel : Codable, Identifiable {
    var id: String
    var nume: String
    var pret: String
    var specialitate: String
}
