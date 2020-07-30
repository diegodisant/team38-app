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
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()

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

// MARK: - QRCodeReaderViewController Delegate

extension StatusVC: QRCodeReaderViewControllerDelegate {
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

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
