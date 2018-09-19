//
//  ViewController.swift
//  Instagram-login
//
//  Created by Jorge Mendoza on 9/19/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
        let navBtn = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(selector))
        
        self.navigationItem.rightBarButtonItem = navBtn
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func selector(sender: UIBarButtonItem){
        InstagramService.shared.something()
    }
    
}

