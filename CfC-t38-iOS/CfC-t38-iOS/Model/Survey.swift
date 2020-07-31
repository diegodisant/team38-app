//
//  Survey.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class Survey: NSObject, NSCoding {
    var questions: [Question]?
    var answered: Bool?
    var date: Date?
    
    init(questions: [Question], answered: Bool, date: Date) {
        self.questions = questions
        self.answered = answered
        self.date = date
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.questions = aDecoder.decodeObject(forKey: "questions") as? [Question]
        self.answered = aDecoder.decodeObject(forKey: "answered") as? Bool
        self.date = (aDecoder.decodeObject(forKey: "date") as? NSDate) as Date?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.questions, forKey: "questions")
        aCoder.encode(self.answered, forKey: "answered")
        aCoder.encode(self.date, forKey: "date")
    }
}
