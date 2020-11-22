//
//  WebService.swift
//  SwiftbookMy
//
//  Created by Roman Vostrikov on 11/21/20.
//

import Foundation
import Combine

class WebService {
    
    enum ApiError: Error, LocalizedError {
        case unknown, apiError(reason: String)
    }
 
    static func fetchApi() -> AnyPublisher<[EmployeeDatum], Error> {
        let urlString = "http://dummy.restapiexample.com/api/v1/employees"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw ApiError.apiError(reason: "somethink went wrong")
                }
                return data
            }
            .decode(type: EmployeeRoot.self, decoder: JSONDecoder())
            .map { $0.data! }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
   
}
