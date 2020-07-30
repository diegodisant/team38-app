//
//  Question.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

enum Answer: String {
    case yes = "yes"
    case no = "no"
    case undefined = "undefined"
}

struct Question {
    var sentence: String
    var answer: Answer
}
