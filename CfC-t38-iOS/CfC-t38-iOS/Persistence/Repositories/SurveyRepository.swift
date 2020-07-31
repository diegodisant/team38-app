//
//  SurveyRepository.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/31/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class SurveyRepository {
    
    let pm = PersistenceManager()
    let surveyPersName = "survey"
    
    func get() throws -> Survey {
        return try pm.getObject(fileName: surveyPersName) as! Survey
    }
    
    func set(survey: Survey) throws {
        try pm.saveObject(fileName: surveyPersName, object: survey)
    }
    
}
