//
//  ViewController.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 02/08/2022.
//

import UIKit
import ScanditCaptureCore
import ScanditBarcodeCapture

class ViewController: UIViewController {
    
    let context = DataCaptureContext(licenseKey: "AQlhnCc5BfasIjzCWkLoElk16WDBGZEY+iqgFNx8RwNLWrV0XXg8CMAiVvXXXci8T12pztBP93DrGuRXZFxmO8FmwDX5eM4x1VIqNc1hjzPURSPR5HfrGXAYkngzItO7HSENhZcz1Qf8ZSoNw1+VCLN8v6hjYCUQAXqYU6hDPH1ZT7omCmjlVXhkA4XcSYlN9nCuPutOaRv3XRhlkyzS8gB2uT+wCVeMSntKad1V8tYjcpEYJ3Tj/0xpTr4WUDeN+lDViWIPrVPnalX9N0IX3y93WsEkWsPR7lBTECVtcA+0czNXC0quzIRMoY2fHKlEo3ZvdbBFoQ8oWACOOV1wkA5sxdchcHqSvV4lRmVyFVKjc8aElmrRv0lxaNvsVEFVUXZCYGZC16xPL1l0MFTpdBV7KrJbZ5baYF8iFE1aOVPSG8kWE2MwQGpXQ7obYAZixmLSyypgyfepSwcraEqOphUpZ0bgTOmpvDNb7YFBI0CrUhnhMTpJsphVE3YFdDj9l202tPFa8k+Bfb14emuM1CNqLkljWgrSbQyPvH3hEcWD72FlibujWZ9XPBQoIZmOrt3Yja4pwbZz/fZx7TQtZccRH1e3UW84nBJ1k0P7wKYG75nxbZ51S1gWL2h2i+XGSIw1VidM8A7CCKuXiOp5y/2lB9B0XPIEXvZ+lOJCZ9cdxPMl14srwWpRpAHd+5uWI6RBykHNdu3/5THrekhAhoIo0bIoOa30h908x7yKzeWsJkdTQI3X1f98qwS8+RennwvI0amda0Q16bG1zZ8xTmrPdh1CF01Uf34uWuIbsGKuHa33QuCmZHuk04d1uXU408DJPW3r6UA+xNxg8+XGXWe045tFukiGHr7kP1KLsFjYhZ1HovG8YSF8cU8MsXfrwTm8vEqPit2ZyWXIUl80UQHv1zRJOd2vWal6DRqZE9Yd8boeNNv+hAC6XdUNH2+EX4MyWE1zllEgTVBxDW549AnMIZCcNfjwOh9nXOIb0vw9K93XE8fB+ANJjd15B1gvSB0MvdKnEzDDVg8tI/cpF7QrgehUBlD/wOp2pDap9ZidGstq1PZVXVoPq+TkWhDLO+diEmsON64lG18Qvs95QY/qzJdyfJOF/0braXZPw6S5yqhyxq+Wt8O7IiM1Y2UANt9CPnAMvpoFeMC1LUHBcmAIazwjpPfa8Mi3iKTdcO5z2AfHXohf7tIvmASx1/D7N6bgl18X67SrnQ==")
    
    let settings = BarcodeCaptureSettings()
    
    @IBOutlet weak var cameraView: UIView!
    var barcodeCapture: BarcodeCapture? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cameraView.layer.cornerRadius = 10
//        cameraView.layer.masksToBounds = true
        self.title = "Scan Product"
        settings.set(symbology: .code128, enabled: true)
        settings.set(symbology: .code39, enabled: true)
        settings.set(symbology: .qr, enabled: true)
        settings.set(symbology: .ean8, enabled: true)
        settings.set(symbology: .upce, enabled: true)
        settings.set(symbology: .ean13UPCA, enabled: true)
        
        
        barcodeCapture = BarcodeCapture(context: context, settings: settings)
        
        barcodeCapture!.addListener(self)
        
        let cameraSettings = BarcodeCapture.recommendedCameraSettings

        // Depending on the use case further camera settings adjustments can be made here.

        let camera = Camera.default
        camera?.apply(cameraSettings)
        
        context.setFrameSource(camera)
        
        camera?.switch(toDesiredState: .on)
        
        let captureView = DataCaptureView(context: context, frame: cameraView.bounds)
        captureView.scanAreaMargins = MarginsWithUnit(left: FloatWithUnit(value: 30, unit: .dip),
                                          top: FloatWithUnit(value: 200, unit: .dip),
                                          right: FloatWithUnit(value: 30, unit: .dip),
                                          bottom: FloatWithUnit(value: 200, unit: .dip))
        captureView.context = context
//        captureView.layer.cornerRadius = 10
//        captureView.layer.masksToBounds = true
        captureView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cameraView.addSubview(captureView)
        
        let overlay = BarcodeCaptureOverlay(barcodeCapture: barcodeCapture!, view: captureView)
      
        overlay.shouldShowScanAreaGuides = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.barcodeCapture?.isEnabled = true
    }
    
    func showSimpleAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
            self.barcodeCapture!.isEnabled = true
        }))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }


}
extension ViewController: BarcodeCaptureListener {
  func barcodeCapture(_ barcodeCapture: BarcodeCapture,
                   didScanIn session: BarcodeCaptureSession,
                   frameData: FrameData) {
        let recognizedBarcodes = session.newlyRecognizedBarcodes
        for barcode in recognizedBarcodes {
            // Do something with the barcode.
//            barcodeCapture.isEnabled = false
            print(barcode.jsonString)
            barcodeCapture.isEnabled = false
            
//            WebService.shared.getFoodFactsProduct(from: barcode.data!) { [weak self] product, error, response in
//                guard let self = self else { return }
//                guard error == nil else {
//                    print(error?.localizedDescription)
////                    barcodeCapture.isEnabled = true
//                    self.showSimpleAlert(errorMessage: error?.localizedDescription ?? "Error Found!")
//                    return
//                }
//
//                guard response as? HTTPURLResponse == nil else {
//                          print("Error with the response, unexpected status code: \(response)")
////                          barcodeCapture.isEnabled = true
//                          self.showSimpleAlert(errorMessage: "Product Not Found!")
//                          return
//                      }
//
//
//
//                guard let product = product else { return }
//                guard product.products!.count > 0 else {
//                    self.showSimpleAlert(errorMessage: "Product Not Found!")
//                    return
//                }
//                guard let products = product.products?[0] else { return }
//
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "ProductVC") as! ProductVC
//                    vc.openFoodFactProduct = products
////                    barcodeCapture.isEnabled = true
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//            }
            
//            WebService.shared.getProduct(from: barcode.data!) { [weak self] product, error, response in
//
//                guard let self = self else { return }
//                guard error == nil else {
//                    print(error?.localizedDescription)
////                    barcodeCapture.isEnabled = true
//                    self.showSimpleAlert(errorMessage: error?.localizedDescription ?? "Error Found!")
//                    return
//                }
//
//                guard response as? HTTPURLResponse == nil else {
//                          print("Error with the response, unexpected status code: \(response)")
////                          barcodeCapture.isEnabled = true
//                          self.showSimpleAlert(errorMessage: "Product Not Found!")
//                          return
//                      }
//
//
//
//                guard let product = product, let products = product.products?[0] else { return }
//
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "ProductVC") as! ProductVC
//                    vc.product = products
////                    barcodeCapture.isEnabled = true
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//
//            }
            
            
            WebService.shared.getBarcodeSpiderProduct(from: barcode.data!) { [weak self] product, error, response in

                guard let self = self else { return }
                guard error == nil else {
                    print(error?.localizedDescription)
//                    barcodeCapture.isEnabled = true
                    self.showSimpleAlert(errorMessage: error?.localizedDescription ?? "Error Found!")
                    return
                }

                guard response as? HTTPURLResponse == nil else {
                          print("Error with the response, unexpected status code: \(response)")
//                          barcodeCapture.isEnabled = true
                          self.showSimpleAlert(errorMessage: "Product Not Found!")
                          return
                      }



                guard let product = product, let products = product.item_attributes else { return }

                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ProductVC") as! ProductVC
                    vc.barcodeSpiderProduct = products
//                    barcodeCapture.isEnabled = true
                    self.navigationController?.pushViewController(vc, animated: true)
                }

            }
            
            
//            WebService.shared.getProduct(from: barcode.data!) { [weak self] product, error in
//                print(product)
//                print(error?.localizedDescription)
//
//                if error != nil {
//
//                }
//                guard let self = self else { return }
//
//                guard let product = product, let products = product.products?[0] else { return }
//
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "ProductVC") as! ProductVC
//                    vc.product = products
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//
//            }
            
            
        }
    }
}
