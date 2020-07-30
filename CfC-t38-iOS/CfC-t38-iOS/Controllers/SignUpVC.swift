//
//  SignUpVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var genderSC: UISegmentedControl!
    
    @IBOutlet weak var birthdateDP: UIDatePicker!
    
    @IBOutlet weak var curpField: UITextField!
    
    @IBOutlet weak var policySwt: UISwitch!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpBtn.applyStyle()
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        print("sign up")
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
