//
//  User.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

enum Gender: String {
    case male = "M"
    case female = "F"
}

class User: NSObject, NSCoding {
    var id: String?
    var curp: String?
    var birthdate: Date?
    var gender: Gender?
    var deviceId: String?
    var isQuarantined: Bool?
    
    init(id: String, curp: String, birthdate: Date, gender: Gender, deviceId: String, isQuarantined: Bool) {
        self.id = id
        self.curp = curp
        self.birthdate = birthdate
        self.gender = gender
        self.deviceId = deviceId
        self.isQuarantined = isQuarantined
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.curp = aDecoder.decodeObject(forKey: "curp") as? String
        self.birthdate = (aDecoder.decodeObject(forKey: "birthdate") as? NSDate) as Date?
        self.gender = Gender(rawValue: aDecoder.decodeObject(forKey: "gender") as? String ?? "")
        self.deviceId = aDecoder.decodeObject(forKey: "deviceId") as? String
        self.isQuarantined = aDecoder.decodeObject(forKey: "isQuarantined") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.curp, forKey: "curp")
        aCoder.encode(self.birthdate, forKey: "birthdate")
        aCoder.encode(self.gender?.rawValue, forKey: "gender")
        aCoder.encode(self.deviceId, forKey: "deviceId")
        aCoder.encode(self.isQuarantined, forKey: "isQuarantined")
    }
}
