//
//  ViewController.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 adorsys GmbH & Co KG. All rights reserved.
//

import UIKit

import YesWeScan
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

    // MARK: IBOutlets
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var editButton: UIButton!
    @IBOutlet private var shareButton: UIButton!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        set(isVisible: false)
        addToSiriShortcuts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

       imageView.image = nil
       scannedImage = nil
    }

    private func set(isVisible: Bool) {
        imageView.isHidden = !isVisible
        editButton.isHidden = !isVisible
        shareButton.isHidden = !isVisible
    }
}

extension ViewController: ScannerViewControllerDelegate {
    func scanner(_ scanner: ScannerViewController,
                 didCaptureImage image: UIImage) {

        scannedImage = image
        navigationController?.popViewController(animated: true)
    }
}

extension ViewController: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController,
                            didCropTo image: UIImage,
                            with cropRect: CGRect,
                            angle: Int) {

        scannedImage = image
        cropViewController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController {
    @IBAction func scanDocument(_ sender: UIButton) {
        openDocumentScanner()
    }

    @IBAction func editImage(_ sender: UIButton) {
        guard let image = scannedImage
            else { return }

        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self

        present(cropViewController, animated: true)
    }

    @IBAction func actionShare(_ sender: UIButton) {
        guard let image = scannedImage
            else { return }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true)
    }
}

extension ViewController {
    func addToSiriShortcuts() {
        if #available(iOS 12.0, *) {
            let identifier = Bundle.main.userActivityIdentifier
            let activity = NSUserActivity(activityType: identifier)
            activity.title = "Scan Document"
            activity.userInfo = ["Document Scanner": "open document scanner"]
            activity.isEligibleForSearch = true
            activity.isEligibleForPrediction = true
            activity.persistentIdentifier = NSUserActivityPersistentIdentifier(identifier)
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
