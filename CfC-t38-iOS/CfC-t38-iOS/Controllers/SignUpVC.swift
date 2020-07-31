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
    
    @IBOutlet weak var infectedSwt: UISwitch!
    
    @IBOutlet weak var policySwt: UISwitch!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpBtn.applyStyle()
        birthdateDP.datePickerMode = UIDatePicker.Mode.date
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        print("sign up")
        print("gender", genderSC.selectedSegmentIndex)
        print("curpField", curpField.text ?? "")
        print("infectedSwt", infectedSwt.isOn)
        print("policySwt", policySwt.isOn)
        self.performSegue(withIdentifier: "Status", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }

}
