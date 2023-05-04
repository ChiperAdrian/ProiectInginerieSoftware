//
//  DoctoriTabView.swift
//  MedicalFacultateV2
//
//  Created by Adrian Gabriel Chiper on 11.04.2023.
//

import SwiftUI



struct DoctoriTabView: View {
    //@StateObject var manager = DBManager.shared
    @State var text: String = ""
    @State var doctori: [DoctorModel] = []


     
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment:.leading) {
                    SearchBarComponent(text: $text).padding(.bottom)
                    ForEach(doctori) { doctor in
                        HStack(alignment: .top) {
                            VStack(alignment:.leading) {
                                Text("\(doctor.nume) \(doctor.prenume)")
                                Text("\(doctor.titlu)")
                            }
                            Spacer()
                            VStack {
                                // VEZI PROGRAMARI
                                NavigationLink {
                                    DoctorProgramari(doctorId: doctor.id)
                                }label: {
                                    Text("Vezi consultatii")
                                        .frame(width: 150, height: 30)
                                        .background(.blue)
                                        .cornerRadius(12)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .bold()
                                }
                                // ADAUGA CONSULTATII
                                NavigationLink {
                                    AdaugaConsultatieView(doctor: doctor)
                                }label: {
                                    Text("Adauga data")
                                        .frame(width: 150, height: 30)
                                        .background(.blue)
                                        .cornerRadius(12)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .bold()
                                }
                                
                                // VEZI CONSULTATII
                                NavigationLink {
                                    ConsultatiiView(doctor: doctor)
                                }label: {
                                    Text("Vezi disponibilitate")
                                        .frame(width: 150, height: 30)
                                        .background(.blue)
                                        .cornerRadius(12)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .bold()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.blue, lineWidth: 1)
                        )
                    }
                    

                }.padding()
            }
            .task {
                print("FETCH DOCTORI")
                await DBManager.shared.fetchDoctors2 { doctori in
                    self.doctori = doctori
                }
            }
            .onDisappear {
                doctori = []
            }
        }
        .tabItem {
            Image(systemName: "house")
            Text("Doctori")
        }
    }
}

struct DoctoriTabView_Previews: PreviewProvider {
    static var previews: some View {
        DoctoriTabView()
    }
}
struct SearchBarComponent: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Search")
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 40)
        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
        .foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
        .cornerRadius(12)
    }
}

































//struct DoctoriTabView: View {
//    @StateObject var manager = DBManager.shared
//    @State var text: String = ""
//
//
//
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment:.leading) {
//                    SearchBarComponent(text: $text).padding(.bottom)
//                    ForEach(manager.doctori) { doctor in
//                        HStack(alignment: .top) {
//                            VStack(alignment:.leading) {
//                                Text("\(doctor.nume) \(doctor.prenume)")
//                                Text("\(doctor.titlu)")
//                            }
//                            Spacer()
//                            VStack {
//                                // VEZI PROGRAMARI
//                                NavigationLink {
//                                    DoctorProgramari(doctorId: doctor.id)
//                                }label: {
//                                    Text("Vezi programari")
//                                        .frame(width: 150, height: 30)
//                                        .background(.blue)
//                                        .cornerRadius(12)
//                                        .foregroundColor(.white)
//                                        .font(.footnote)
//                                        .bold()
//                                }
//                                // ADAUGA CONSULTATII
//                                NavigationLink {
//                                    AdaugaConsultatieView(doctor: doctor)
//                                }label: {
//                                    Text("Adauga consultatii")
//                                        .frame(width: 150, height: 30)
//                                        .background(.blue)
//                                        .cornerRadius(12)
//                                        .foregroundColor(.white)
//                                        .font(.footnote)
//                                        .bold()
//                                }
//
//                                // VEZI CONSULTATII
//                                NavigationLink {
//                                    ConsultatiiView(doctor: doctor)
//                                }label: {
//                                    Text("Vezi consultatii")
//                                        .frame(width: 150, height: 30)
//                                        .background(.blue)
//                                        .cornerRadius(12)
//                                        .foregroundColor(.white)
//                                        .font(.footnote)
//                                        .bold()
//                                }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(.blue, lineWidth: 1)
//                        )
//                    }
//
//
//                }.padding()
//            }
//        }
//        .tabItem {
//            Image(systemName: "house")
//            Text("Doctori")
//        }
//    }
//}
//
//struct DoctoriTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoctoriTabView()
//    }
//}
//struct SearchBarComponent: View {
//    @Binding var text: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//            Text("Search")
//            Spacer()
//        }
//        .padding(.horizontal)
//        .frame(height: 40)
//        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
//        .foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
//        .cornerRadius(12)
//    }
//}
