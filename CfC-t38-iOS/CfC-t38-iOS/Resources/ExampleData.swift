//
//  ExampleData.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

struct ExampleData {
    static let aUser = User(curp: "A1FC", birthdate: Date(), gender: .male, deviceId: "RRRR", isQuarantined: false)
    static let aUser2 = User(curp: "A1FC", birthdate: Date(), gender: .male, deviceId: "RRRR", isQuarantined: true)
    static let someQuestions = [
        Question(sentence: "¿Te sientes mal?", answer: .undefined),
        Question(sentence: "¿Tienes fiebre?", answer: .undefined)
    ]
    static let aSurvey = Survey(questions: someQuestions, answered: false, date: Date())
    static let anExposure = Exposure(deviceId: "DDDD", intensity: 3, date: Date())
    static let lastExposures = LastExposures(start: Date(), end: Date(), exposures: [anExposure], sent: false)
}
