//
//  ViewModel.swift
//  APICalls
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import Foundation

struct Course: Codable, Hashable {
//    var id = UUID()
    var name: String
    var image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func loadData() async {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Course].self, from: data) {
                courses = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    
    }
}
