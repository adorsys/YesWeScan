//
//  ViewController.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit

import DocumentScanner
import TOCropViewController

class ViewController: UIViewController {
    // MARK: private fields
    private var scannedImage: UIImage? {
        willSet {
            set(isVisible: newValue != nil)
        } didSet {
            imageView.image = scannedImage
        }
    }

    //private var previewingController: UIViewControllerPreviewing
    private lazy var tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(editImage))

    // MARK: IBOutlets
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var editButton: UIButton!

    // MARK: Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        set(isVisible: false)

        self.tapRecogniser.delegate = self
        self.view.addGestureRecognizer(tapRecogniser)
        
        addToSiriShortcuts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        self.imageView.image = nil
        self.scannedImage = nil
    }

    private func set(isVisible: Bool) {
        imageView.isHidden = !isVisible
        editButton.isHidden = !isVisible
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard scannedImage != nil else {
            return false
        }

        return imageView.bounds.contains(self.view.convert(tapRecogniser.location(in: self.view), to: imageView))
    }
}

extension ViewController: ScannerViewControllerDelegate {
    func scanner(_ scanner: ScannerViewController,
                 didCaptureImage image: UIImage) {

        self.scannedImage = image

        navigationController?.popViewController(animated: true)
    }
}

extension ViewController: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController,
                            didCropToImage image: UIImage,
                            rect cropRect: CGRect,
                            angle: Int) {

        self.scannedImage = image
        cropViewController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController {
    @IBAction func scanDocument(_ sender: UIButton) {
        let scanner = ScannerViewController()
        scanner.delegate = self
        navigationController?.pushViewController(scanner, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func editImage(_ sender: UIButton) {
        guard let image = self.scannedImage
            else { return }

        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self

        present(cropViewController, animated: true)
    }
}

extension ViewController {
    func addToSiriShortcuts(){
        if #available(iOS 12.0, *) {
            let activity = NSUserActivity(activityType: "de.adorsys.DocumentScannerApp.OpenDocumentScanner")
            activity.title = "Scan Document"
            activity.userInfo = ["Document Scanner" : "open document scanner"]
            activity.isEligibleForSearch = true
            activity.isEligibleForPrediction = true
            activity.persistentIdentifier = NSUserActivityPersistentIdentifier("de.adorsys.DocumentScannerApp.OpenDocumentScanner")
            view.userActivity = activity
            activity.becomeCurrent()
        }
    }
    
    public func openDocumentScanner() {
        let scanner = ScannerViewController()
        scanner.delegate = self
        navigationController?.pushViewController(scanner, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
