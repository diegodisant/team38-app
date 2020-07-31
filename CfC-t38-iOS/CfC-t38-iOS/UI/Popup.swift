//
//  Popup.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/31/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit

struct Popup {
    static func showPopupMessage(vc: UIViewController, title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(
            title: title,
            message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction: UIAlertAction = UIAlertAction(
            title: "Aceptar",
            style: UIAlertAction.Style.default,
            handler: { action in
                // Ok action
                print("Ok")
        })
        alertController.addAction(okAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showUpdateStatusDialog(vc: UIViewController, completionOk: @escaping () -> Void, completionCancel: (() -> Void)?) {
        let alertController: UIAlertController = UIAlertController(
            title: "Advertencia",
            message: "¿Está seguro/a?\nRecuerda que luego no podrás cambiar de parecer hasta que hayan transcurido 14 días o si te realizas una nueva prueba", preferredStyle: UIAlertController.Style.alert)
        let okAction: UIAlertAction = UIAlertAction(
            title: "Sí",
            style: UIAlertAction.Style.default,
            handler: { action in
                completionOk()
        })
        let cancelAction: UIAlertAction = UIAlertAction(
            title: "No",
            style: UIAlertAction.Style.cancel,
            handler: { action in
                completionCancel?()
        })
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
