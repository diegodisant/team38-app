//
//  SurveyVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

let questionCellReuseIdentifier = "QuestionCell"

class SurveyVC: UIViewController {
    
    var survey: Survey!

    @IBOutlet weak var surveyTable: UITableView!
    
    @IBOutlet weak var surveyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        survey = ExampleData.aSurvey

        surveyTable.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: questionCellReuseIdentifier)
        surveyTable.dataSource = self
        surveyTable.delegate = self
        surveyTable.reloadData()
        
        surveyBtn.applyStyle()
    }
    
    @IBAction func sendSurvey(_ sender: UIButton) {
        print("send survey")
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
