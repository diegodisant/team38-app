//
//  Exposure.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class Exposure: NSObject, NSCoding {
    var deviceId: String?
    var intensity: Int?
    var date: Date?
    
    init(deviceId: String, intensity: Int, date: Date) {
        self.deviceId = deviceId
        self.intensity = intensity
        self.date = date
    }
    
    required init(coder aDecoder: NSCoder) {
        deviceId = aDecoder.decodeObject(forKey: "deviceId") as? String
        intensity = aDecoder.decodeObject(forKey: "intensity") as? Int
        date = (aDecoder.decodeObject(forKey: "date") as? NSDate ?? NSDate()) as Date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(deviceId, forKey: "deviceId")
        aCoder.encode(intensity, forKey: "intensity")
        aCoder.encode(date, forKey: "date")
    }
}
