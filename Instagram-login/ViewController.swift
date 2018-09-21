//
//  ViewController.swift
//  Instagram-login
//
//  Created by Jorge Mendoza on 9/19/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items:[String]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    let cellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        
        items = []
        
       tableView.register(UITableViewCell.self, forCellReuseIdentifier:cellIdentifier)
        
        addCustomHeaderStyle(title: "Instagram")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if InstagramService.shared.isAuthenticated() {
            
            InstagramService.shared.getUserData{
                list in
                self.items = list
            }
            
            let navBtn = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(logout))
            self.navigationItem.rightBarButtonItem = navBtn
            
        } else {
            let navBtn = UIBarButtonItem(image: UIImage(named:"instagram"), style: .plain, target: self, action: #selector(login))
            self.navigationItem.rightBarButtonItem = navBtn
            items = ["Login with Instagram"]
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = items?[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    @objc func login(sender: UIBarButtonItem){
        InstagramService.shared.login()
    }
    
    @objc func logout(sender: UIBarButtonItem){
        InstagramService.shared.instagramLogout()
//        items = []
        items = ["Login with Instagram"]
        let navBtn = UIBarButtonItem(image: UIImage(named:"instagram"), style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = navBtn
    }

}

extension UIViewController {
    
    public func addCustomHeaderStyle(title:String){
        
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = title
        
        let textAttributes:[NSAttributedString.Key:Any]? =
            [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):UIColor.black
                ,NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont(name: "Helvetica Neue", size: 32.0)!]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
    }
    
}
