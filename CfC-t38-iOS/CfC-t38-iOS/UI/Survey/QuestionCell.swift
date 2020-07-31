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
        self.contentView.layer.cornerRadius = self.contentView.frame.width/30
        self.yesBtn.layer.cornerRadius = self.yesBtn.frame.width/20
        self.noBtn.layer.cornerRadius = self.noBtn.frame.width/20
    }
    
    func update() {
        questionSentence.text = question.sentence
        yesBtn.backgroundColor = .white
        noBtn.backgroundColor = .white
        if question.answer == .yes {
            yesBtn.backgroundColor = Constants.Colors.buttonRed
            noBtn.backgroundColor = UIColor.white
        } else if question.answer == .no {
            yesBtn.backgroundColor = UIColor.white
            noBtn.backgroundColor = Constants.Colors.buttonRed
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
