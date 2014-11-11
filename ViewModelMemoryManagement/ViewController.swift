//
//  ViewController.swift
//  ViewModelMemoryManagement
//
//  Created by Emanuele Rudel on 10/11/14.
//  Copyright (c) 2014 BuddyHopp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties

    var viewModel = MyViewModel(title: "my view model")
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Managing the View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RAC(titleLabel, "text") ~> RACObserve(viewModel, "title").doNext({ [unowned self] _ in
            println("Label: \(self.titleLabel.text)")
        })
    }
    
    // MARK: Actions
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

