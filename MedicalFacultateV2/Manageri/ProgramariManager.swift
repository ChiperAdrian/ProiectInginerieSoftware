//
//  ProgramariManager.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation
class ProgramariManager: ObservableObject {
    static let shared = ProgramariManager()
    private init() {}
    
    @Published var specialitate: String = ""
    @Published var doctor = ""
    @Published var serviciu = ""
    @Published var data = ""
    @Published var pacient: PacientModel?
    @Published var consultatie: ConsultatieModel?
}
