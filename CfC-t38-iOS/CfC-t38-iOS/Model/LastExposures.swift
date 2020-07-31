//
//  LastExposures.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class LastExposures: NSObject, NSCoding {
    var start: Date?
    var end: Date?
    var exposures: [Exposure]?
    var sent: Bool?
    
    init(start: Date, end: Date, exposures: [Exposure], sent: Bool) {
        self.start = start
        self.end = end
        self.exposures = exposures
        self.sent = sent
    }
    
    required init(coder aDecoder: NSCoder) {
        start = (aDecoder.decodeObject(forKey: "start") as? NSDate ?? NSDate()) as Date
        end = (aDecoder.decodeObject(forKey: "end") as? NSDate ?? NSDate()) as Date
        exposures = aDecoder.decodeObject(forKey: "exposures") as? [Exposure]
        sent = aDecoder.decodeObject(forKey: "sent") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(start, forKey: "start")
        aCoder.encode(end, forKey: "end")
        aCoder.encode(exposures, forKey: "exposures")
        aCoder.encode(sent, forKey: "sent")
    }
}
