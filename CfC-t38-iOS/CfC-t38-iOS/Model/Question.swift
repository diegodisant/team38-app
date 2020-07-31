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

class Question: NSObject, NSCoding {
    var sentence: String?
    var answer: Answer?
    
    init(sentence: String, answer: Answer) {
        self.sentence = sentence
        self.answer = answer
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sentence = aDecoder.decodeObject(forKey: "sentence") as? String
        self.answer = Answer(rawValue: aDecoder.decodeObject(forKey: "answer") as? String ?? "undefined")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.sentence, forKey: "sentence")
        aCoder.encode((self.answer ?? .undefined).rawValue, forKey: "answer")
    }
}
