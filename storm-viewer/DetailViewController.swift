//
//  DetailViewController.swift
//  storm-viewer
//
//  Created by Renan Kosicki on 8/28/15.
//  Copyright (c) 2015 Renan Kosicki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    //MARK: - Lifecycle -
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    //MARK: - View Configuration -
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }
    
    //MARK: - Actions -
    
    func shareTapped() {
        let activityViewController = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        presentViewController(activityViewController, animated: true, completion: nil)
    }
}

