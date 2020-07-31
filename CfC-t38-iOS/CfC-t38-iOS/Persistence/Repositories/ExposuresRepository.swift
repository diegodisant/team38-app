//
//  ExposuresRepository.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/31/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class ExposuresRepository {
    
    let pm = PersistenceManager()
    let exposuresPersName = "exposures"
    
    func get() throws -> LastExposures {
        return try pm.getObject(fileName: exposuresPersName) as! LastExposures
    }
    
    func set(exposures: LastExposures) throws {
        try pm.saveObject(fileName: exposuresPersName, object: exposures)
    }
    
}
