//
//  StatusVC.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader

class StatusVC: UIViewController {
    
    var user: User!
    
    var userRepo: UserRepository!
    
    var surveyRepo: SurveyRepository!
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)

            // Configure the view controller (optional)
            $0.showTorchButton = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton = false
            $0.showOverlayView = true
            $0.rectOfInterest = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }

        return QRCodeReaderViewController(builder: builder)
    }()

    @IBOutlet weak var statusIcon: UIView!
    
    @IBOutlet weak var statusParagraph: UILabel!
    
    @IBOutlet weak var surveyBtn: UIButton!
    
    @IBOutlet weak var testParagraph: UILabel!
    
    @IBOutlet weak var updateStatusBtn: UIButton!
    
    @IBOutlet weak var warningParagraph: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userRepo = UserRepository()
        surveyRepo = SurveyRepository()
        do {
            user = try userRepo.get()
        } catch {
            Popup.showPopupMessage(vc: self, title: "Error", message: "Usuario no registrado")
            return
        }
        
        statusIcon.alpha = 0
        surveyBtn.applyStyle()
        updateStatusBtn.applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUIStatus()
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
        // Retrieve the QRCode content
        // By using the delegate pattern
        readerVC.delegate = self

        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print("qr value", result?.value ?? "None")
        }

        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet

        present(readerVC, animated: true, completion: nil)
    }
    
    @IBAction func takeSurvey(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Survey", sender: self)
    }
    
    @IBAction func updateStatus(_ sender: UIButton) {
        Popup.showUpdateStatusDialog(vc: self, completionOk: {
            do {
                self.user.isQuarantined = true
                try self.userRepo.set(user: self.user)
                // MARK: TODO
                try self.surveyRepo.set(survey: ExampleData.aSurvey)
            } catch {
                Popup.showPopupMessage(vc: self, title: "Error", message: "No se pudo cambiar estado")
                self.user.isQuarantined = false
            }
            self.updateUIStatus()
        }, completionCancel: nil)
    }
    
    func updateUIStatus() {
        if user.isQuarantined ?? false {
            uiStatusPositive()
        } else {
            uiStatusNegative()
        }
    }
    
    func uiStatusPositive() {
        statusIcon.backgroundColor = Constants.Colors.statusRed
        statusParagraph.text = Constants.StatusParagraph.positive
        let survey = try? surveyRepo.get()
        if survey != nil && !(survey!.answered ?? false) {
            surveyBtn.isHidden = false
        }
        testParagraph.isHidden = true
        updateStatusBtn.isHidden = true
        warningParagraph.isHidden = true
    }
    
    func uiStatusNegative() {
        statusIcon.backgroundColor = Constants.Colors.statusGreen
        statusParagraph.text = Constants.StatusParagraph.negative
        surveyBtn.isHidden = true
        testParagraph.isHidden = false
        updateStatusBtn.isHidden = false
        warningParagraph.isHidden = false
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Survey" {
            (segue.destination as! SurveyVC).delegate = self
        }
    }

}

// MARK: - QRCodeReaderViewController Delegate

extension StatusVC: QRCodeReaderViewControllerDelegate {
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        Popup.showPopupMessage(vc: self, title: "Estás entrando en", message: result.value)
        dismiss(animated: true, completion: nil)
    }

    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let cameraName = newCaptureDevice.device.localizedName
        print("Switching capture to: \(cameraName)")
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Survey Delegate

extension StatusVC: SurveyDelegate {
    func wasAnswered(_ answered: Bool) {
        if answered {
            surveyBtn.isHidden = true
        }
    }
}
