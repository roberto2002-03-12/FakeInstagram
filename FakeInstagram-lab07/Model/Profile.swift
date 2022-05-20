//
//  Profile.swift
//  ProjectMVVM
//
//  Created by MAC37 on 7/05/22.
//

import Foundation

struct Profile: Codable {
    let firstName: String
    let lastName: String
    let picture: String
    let gender: String
    let email: String
    let phone: String
    let location: Location
}

struct Location: Codable {
    let city: String
    let state: String
    let country: String
}
