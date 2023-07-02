//
//  ContentView.swift
//  APICalls
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack {
                        AsyncImage(url: URL(string: "\(course.image)")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "video")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 70)
                                .background(.gray)
                        }
                        .frame(width: 130, height: 70)
                        
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .task {
                await viewModel.loadData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
