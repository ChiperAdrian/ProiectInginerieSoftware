//
//  ProgramareModel.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation


struct ProgramareModel: Codable, Identifiable {
    var id: String
    var data: String
    var doctor: String
    var specialitate: String
    var serviciu: String
    var pacient: String
}
