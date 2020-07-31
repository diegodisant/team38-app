//
//  SurveyVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

protocol SurveyDelegate {
    func wasAnswered(_ answered: Bool)
}

let questionCellReuseIdentifier = "QuestionCell"

class SurveyVC: UIViewController {
    
    var survey: Survey!
    
    var surveyRepo: SurveyRepository!
    
    var delegate: SurveyDelegate?

    @IBOutlet weak var surveyTable: UITableView!
    
    @IBOutlet weak var surveyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surveyRepo = SurveyRepository()
        do {
            survey = try surveyRepo.get()
        } catch {
            Popup.showPopupMessage(vc: self, title: "Error", message: "No se pudo obtener la encuesta")
        }

        surveyTable.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: questionCellReuseIdentifier)
        surveyTable.dataSource = self
        surveyTable.delegate = self
        surveyTable.reloadData()
        
        surveyBtn.applyStyle()
    }
    
    @IBAction func sendSurvey(_ sender: UIButton) {
        if validateInputs() {
            do {
                self.survey.answered = true
                try surveyRepo.set(survey: self.survey)
                delegate?.wasAnswered(true)
                self.dismiss(animated: true, completion: nil)
            } catch {
                Popup.showPopupMessage(vc: self, title: "Error", message: "No se pudo enviar la encuesta")
                self.survey.answered = false
            }
        }
    }
    
    func validateInputs() -> Bool {
        guard let questions = survey.questions else {
            Popup.showPopupMessage(vc: self, title: "Aviso", message: "No existen preguntas para contestar")
            return false
        }
        for question in questions {
            if question.answer! == .undefined {
                Popup.showPopupMessage(vc: self, title: "Aviso", message: "Debes contestar todas las preguntas")
                return false
            }
        }
        return true
    }

}

// MARK: - UITableViewDataSource

extension SurveyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return survey.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: questionCellReuseIdentifier, for: indexPath) as! QuestionCell
        guard let questions = survey.questions else {
            return cell
        }
        let question = questions[indexPath.row]
        cell.question = question
        cell.questionNumber.text = "\(indexPath.row + 1)"
        cell.update()
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SurveyVC: UITableViewDelegate {
    
}
