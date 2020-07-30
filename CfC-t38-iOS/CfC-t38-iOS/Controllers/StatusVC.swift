//
//  StatusVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class StatusVC: UIViewController {

    @IBOutlet weak var statusIcon: UIView!
    
    @IBOutlet weak var statusParagraph: UILabel!
    
    @IBOutlet weak var surveyBtn: UIButton!
    
    @IBOutlet weak var testParagraph: UILabel!
    
    @IBOutlet weak var updateStatusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusIcon.alpha = 0
        surveyBtn.applyStyle()
        updateStatusBtn.applyStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.statusIcon.alpha = 1
        }
        statusIcon.layer.cornerRadius = statusIcon.frame.height/2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        statusIcon.alpha = 0
    }
    
    @IBAction func scanStoreCode(_ sender: UIBarButtonItem) {
        print("scan store code")
    }
    
    @IBAction func takeSurvey(_ sender: UIButton) {
        print("take survey")
    }
    
    @IBAction func updateStatus(_ sender: UIButton) {
        print("update status")
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
