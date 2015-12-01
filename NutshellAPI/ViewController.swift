//
//  ViewController.swift
//  NutshellAPI
//
//  Created by Donovan Cotter on 11/30/15.
//  Copyright © 2015 DonovanCotter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nutshellService = NutshellService()
        nutshellService.getContacts() {
            (let contacts) in
            if let nutshellContacts = contacts {
                
                dispatch_async(dispatch_get_main_queue()) {
                print(nutshellContacts)
                    
                }
                
            }
        
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    


}

