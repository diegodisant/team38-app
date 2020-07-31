//
//  StartVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    var user: User?
    var userRepo: UserRepository!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userRepo = UserRepository()
        user = try? userRepo.get()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if user != nil {
            self.performSegue(withIdentifier: "Status", sender: self)
        } else {
            self.performSegue(withIdentifier: "SignUp", sender: self)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }

}
