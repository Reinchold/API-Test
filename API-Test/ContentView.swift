//
//  ContentView.swift
//  API-Test
//
//  Created by Roman Vostrikov on 11/22/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var employeeViewModel = EmployeeViewModel()
    
    var body: some View {
        Form {
            Section {
                Button(action: {self.employeeViewModel.recevedEmployeeData()}) {
                    Text("Get employee name")
                }
            }
            Section {
                List(employeeViewModel.publishingNames, id:\.self) { publishedName in
                    Text("\(publishedName)")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

