//
//  DetailViewController.swift
//  iOS-Numbers-Application
//
//  Created by Michał on 23/01/2019.
//  Copyright © 2019 Michał Gawryluk. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire


class DetailViewController: UIViewController {

   
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    var detail: Number? {
        didSet {
            refreshUI()
        }
    }
    
//    func configureView() {
//        // Update the user interface for the detail item.
//        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
//    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        configureView()
//    }

//    var detailItem: NSDate? {
//        didSet {
//            configureView()
//        }
//    }
    
    func refreshUI() {
        loadViewIfNeeded()
        detailDescriptionLabel.text = detail?.text
//        imageDetail.image = detail?.image
        
//        Alamofire.request(detail.image).responseImage { response in
//            debugPrint(response)
//
//            if let image = response.result.value {
//                self.imageDetail.image = image
//            }
//        }
        
    }
    
    
}

extension DetailViewController: NumberSelectionDelegate {
    func numberSelected(_ newNumber: Number) {
        detail = newNumber
}

}

