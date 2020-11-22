//
//  EmployeeModel.swift
//  SwiftbookMy
//
//  Created by Roman Vostrikov on 11/22/20.
//

import Foundation

// MARK: - EmployeeRoot
struct EmployeeRoot : Codable {
    
    let data : [EmployeeDatum]?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([EmployeeDatum].self, forKey: .data)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
    
}

// MARK: - Datum
struct EmployeeDatum : Codable {
    
    let id : String?
    let employeeName : String?
    let employeeSalary : String?
    let employeeAge : String?
    let profileImage : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        employeeName = try values.decodeIfPresent(String.self, forKey: .employeeName)
        employeeSalary = try values.decodeIfPresent(String.self, forKey: .employeeSalary)
        employeeAge = try values.decodeIfPresent(String.self, forKey: .employeeAge)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
    }
    
}

