//
//  QuestionCell.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    var question: Question!

    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var questionSentence: UILabel!
    
    @IBOutlet weak var yesBtn: UIButton!
    
    @IBOutlet weak var noBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update() {
        questionSentence.text = question.sentence
        yesBtn.backgroundColor = .white
        noBtn.backgroundColor = .white
        if question.answer == .yes {
            yesBtn.backgroundColor = UIColor.gray
            noBtn.backgroundColor = UIColor.white
        } else if question.answer == .no {
            yesBtn.backgroundColor = UIColor.white
            noBtn.backgroundColor = UIColor.gray
        } else {
            yesBtn.backgroundColor = UIColor.white
            noBtn.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func answerYes(_ sender: UIButton) {
        self.question.answer = .yes
        update()
    }
    
    @IBAction func answerNo(_ sender: UIButton) {
        self.question.answer = .no
        update()
    }
    
}
