//
//  ConsultatieModel.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation

struct ConsultatieModel: Identifiable, Codable {
    var id: String
    var doctor: String
    var date: String
    var numarConsultatii: String
}
