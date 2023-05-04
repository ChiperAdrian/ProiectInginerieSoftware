//
//  DBManager.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import Foundation

@MainActor
class DBManager: ObservableObject {
    static let shared = DBManager()
    private init() {}

    @Published var doctori: [DoctorModel] = []
    @Published var specialitati: [SpecialitateModel] = []
    @Published var servicii: [ServiciuMedicalModel] = []
    @Published var programari: [ProgramareModel] = []
    @Published var consultatii: [ConsultatieModel] = []
    @Published var pacienti: [PacientModel] = []
    
    // GET
    func fetchPacienti2(_ completion: @escaping (_ pacienti:[PacientModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/pacienti"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([PacientModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }

    func fetchConsultatii2(_ completion: @escaping (_ consultatii:[ConsultatieModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/consultatii"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([ConsultatieModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }
    func fetchSpecialties2(_ completion: @escaping (_ specialitati:[SpecialitateModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/specialties"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([SpecialitateModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }

    func fetchDoctors2(_ completion: @escaping (_ doctori:[DoctorModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/doctors"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([DoctorModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }
    func fetchServices2(_ completion: @escaping (_ servicii:[ServiciuMedicalModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/services"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([ServiciuMedicalModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }

    func fetchProgramari2(_ completion: @escaping (_ programari:[ProgramareModel]) -> Void) async {
       let urlString =  "http://localhost:36646/api/programari"
       guard let url = URL(string: urlString) else {
          print("Invalid URL")
           completion([])
          return
       }
        do {
           let (data, _) = try await URLSession.shared.data(from:url)
            if let decodedResponse = try? JSONDecoder().decode([ProgramareModel].self, from:data) {
                completion(decodedResponse)
            }
        } catch {
           print("Invalid data")
            completion([])
           return
        }
    }

    // POST
    func adaugaPacient(pacient: PacientModel, _ completion: @escaping () -> Void) {
        let url = URL(string: "http://localhost:36646/api/pacienti")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let session = URLSession.shared
        let parameters: [String: String] = [
            "id": pacient.id,
            "nume": pacient.nume,
            "prenume": pacient.prenume,
            "cnp": pacient.cnp,
            "email": pacient.email,
            "telefon": pacient.telefon
        ]
        do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
         } catch let error {
           print(error.localizedDescription)
           return
         }
        let task = session.dataTask(with: request) { data, response, error in
            completion()
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
              }
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            print(response)
        
        }
        task.resume()
    }
    
    func adaugaConsultatieDoctor(doctorId:String, data:String, numarConsultatii:String, _ completion: @escaping () -> Void) {
        let url = URL(string: "http://localhost:36646/api/consultatii")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let session = URLSession.shared
        let parameters: [String: String] = [
            "id": "1",
            "doctor": doctorId,
            "date": String(data),
            "numarConsultatii": numarConsultatii
        ]
        do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
         } catch let error {
           print(error.localizedDescription)
           return
         }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
              }
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            print(response)
        
        }
        task.resume()
        
    }

    @MainActor
    func adaugaProgramare(programare: ProgramareModel, _ completion: @escaping () -> Void) {
        let url = URL(string: "http://localhost:36646/api/programari")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let session = URLSession.shared
        let parameters: [String: String] = [
            "id": programare.id,
            "data": programare.data,
            "doctor": programare.doctor,
            "specialitate": programare.specialitate,
            "serviciu": programare.serviciu,
            "pacient": programare.pacient
        ]
        do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
         } catch let error {
           print(error.localizedDescription)
           return
         }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
              }
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            print(response)
        }
        task.resume()
    }
    
    func decrementeazaNumarConsultatii(consultatie: ConsultatieModel, _ completion: @escaping () -> Void) {
        let url = URL(string: "http://localhost:36646/api/consultatii")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = Int(consultatie.numarConsultatii) ?? 0 > 1 ? "PUT" : "DELETE"
        let session = URLSession.shared
        let parameters: [String: String] = [
            "id": consultatie.id,
            "doctor": consultatie.doctor,
            "date": consultatie.date,
            "numarConsultatii": String((Int(consultatie.numarConsultatii) ?? 1) - 1)
        ]
        do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
         } catch let error {
           print(error.localizedDescription)
           return
         }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
              }
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            print(response)
        
        }
        task.resume()
        
    }
    
    func anuleazaProgramare(programare: ProgramareModel, _ completion: @escaping () -> Void) {
        let url = URL(string: "http://localhost:36646/api/programari")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "DELETE"
        let session = URLSession.shared
        let parameters: [String: String] = [
            "id": programare.id,
            "data": programare.data,
            "doctor": programare.doctor,
            "specialitate": programare.specialitate,
            "serviciu": programare.serviciu,
            "pacient": programare.pacient
        ]
        do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
         } catch let error {
           print(error.localizedDescription)
           return
         }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
              }
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            print(response)
        
        }
        task.resume()
    }
}
