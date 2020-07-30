//
//  User.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

enum Gender: String {
    case male = "m"
    case female = "f"
}

struct User {
    var curp: String
    var birthdate: Date
    var gender: Gender
    var deviceId: String
    var isQuarantined: Bool
}
