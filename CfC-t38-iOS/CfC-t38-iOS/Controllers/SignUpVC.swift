//
//  SignUpVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    var user: User!
    
    var userRepo: UserRepository!

    @IBOutlet weak var genderSC: UISegmentedControl!
    
    @IBOutlet weak var birthdateDP: UIDatePicker!
    
    @IBOutlet weak var curpField: UITextField!
    
    @IBOutlet weak var infectedSwt: UISwitch!
    
    @IBOutlet weak var policySwt: UISwitch!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userRepo = UserRepository()
        do {
            user = try userRepo.get()
        } catch {
            print("Usuario no registrado")
        }
        
        signUpBtn.applyStyle()
        birthdateDP.datePickerMode = UIDatePicker.Mode.date
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if validateInputs() {
            print("sign up")
            print("gender", genderSC.selectedSegmentIndex)
            print("birthdateDP", birthdateDP.date)
            print("curpField", curpField.text ?? "")
            print("infectedSwt", infectedSwt.isOn)
            print("policySwt", policySwt.isOn)
            do {
                let gender = genderSC.selectedSegmentIndex == 0 ? Gender.female : Gender.male
                // MARK:TODO: id sent from server
                // MARK:TODO: bluetooth device id
                let user = User(id: "idsentfromserver", curp: curpField.text!, birthdate: birthdateDP.date, gender: gender, deviceId: "device", isQuarantined: infectedSwt.isOn)
                try userRepo.set(user: user)
                self.performSegue(withIdentifier: "Status", sender: self)
            } catch {
                Popup.showPopupMessage(vc: self, title: "Error", message: "No se pudo registrar al usuario")
            }
        }
    }
    
    func validateInputs() -> Bool {
        if curpField.text == nil || curpField.text?.count ?? 0 < 1 {
            Popup.showPopupMessage(vc: self, title: "Aviso", message: "Debe ingresar el CURP")
            return false
        }
        if !policySwt.isOn {
            Popup.showPopupMessage(vc: self, title: "Aviso", message: "Debe aceptar los términos y políticas para continuar")
            return false
        }
        return true
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }

}
