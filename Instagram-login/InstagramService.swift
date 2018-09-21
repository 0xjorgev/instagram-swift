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
    
    func login(){
        
        let del = (UIApplication.shared.delegate as! AppDelegate)
        
        api.login(from: del.navigation!, withScopes: [.basic], success: {
            
        }, failure: {
            error in print("Error: \(error) Nop it doesn't work at all")
        })
    }
    
    func isAuthenticated() -> Bool {
        
        return api.isAuthenticated
        
    }
    
    func instagramLogout() {
        api.logout()
    }
    
    func getUserData(completion: @escaping ([String]?) -> Void) {
        
        api.user("self", success: { list in
            completion([
                "Username: \(list.username ?? "")"
                ,"Fullname: \(list.fullName ?? "")"
                ,"Bio: \(list.bio ?? "")"
                ,"Website: \(list.website ?? "")"
                ,"Media: \(list.counts?.media ?? 0)"
                ,"Follows: \(list.counts?.follows ?? 0)"
                ,"Followed By: \(list.counts?.followedBy ?? 0)"
            ])
            
        }, failure: { error in
            completion([])
            print("Error: \(error)")
        })
    }
    
//    api.login(from: navigationController!, success: {
//    // Do your stuff here ...
//    }, failure: { error in
//    print(error.localizedDescription)
//    })
    
}
