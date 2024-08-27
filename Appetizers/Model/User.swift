//
//  User.swift
//  Appetizers
//
//  Created by Prashanti Venna on 14/08/2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
