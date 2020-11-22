//
//  EmployeeViewModel.swift
//  SwiftbookMy
//
//  Created by Roman Vostrikov on 11/22/20.
//

import Foundation
import Combine

class EmployeeViewModel: ObservableObject {
    @Published var publishingNames: [String] = []
    @Published var employeeData: [EmployeeDatum] = []
    
    func recevedEmployeeData() {
        WebService.fetchApi()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    print("finished!")
                case .failure(let error):
                    print("error: ", error)
                }
            }, receiveValue: { value in
                print("receiveValue?: ", value)
                self.employeeData = value
                for i in self.employeeData {
                    self.publishingNames = self.publishingNames + [i.employeeName!]
                }
            })
        
    }
}
