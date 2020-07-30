//
//  StartVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    var signUp = false

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if signUp {
            self.performSegue(withIdentifier: "Status", sender: self)
        } else {
            self.performSegue(withIdentifier: "SignUp", sender: self)
            signUp = true
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }

}
