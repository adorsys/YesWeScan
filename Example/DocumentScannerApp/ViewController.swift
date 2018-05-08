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
    private var scannedImage: UIImage? {
        willSet {
            set(isVisible: newValue != nil)
        } didSet {
            imageView.image = scannedImage
        }
    }

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var editButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        set(isVisible: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func set(isVisible: Bool) {
        imageView.isHidden = !isVisible
        editButton.isHidden = !isVisible
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
                            didCropToImage image: UIImage,
                            rect cropRect: CGRect,
                            angle: Int) {
        scannedImage = image

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
        guard let image = self.scannedImage else { return }

        let cropViewController = TOCropViewController(image: image)
        cropViewController.delegate = self

        present(cropViewController, animated: true)
    }
}
