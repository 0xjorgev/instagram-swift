//
//  InstagramService.swift
//  Instagram-login
//
//  Created by Jorge Mendoza on 9/19/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation
import SwiftInstagram

class InstagramService:NSObject {
    
    static let shared = InstagramService()
    
    let api = Instagram.shared
    
    func something(){
        
        let del = (UIApplication.shared.delegate as! AppDelegate)
        
        api.login(from:del.navigation!  , success: {
            
            print("Yes i did it!")
            
        }, failure: { error in
            print("Error: \(error) Nop it doesn't work at all")
        })
    }
    
//    api.login(from: navigationController!, success: {
//    // Do your stuff here ...
//    }, failure: { error in
//    print(error.localizedDescription)
//    })
    
}
