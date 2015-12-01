//
//  Contact.swift
//  NutshellAPI
//
//  Created by Donovan Cotter on 12/1/15.
//  Copyright © 2015 DonovanCotter. All rights reserved.
//

import Foundation

class Contact {
    var name: String?
    var email: String?
    

    init(contactDictionary: [String: AnyObject]) {
        name = contactDictionary["name"] as? String
        email = contactDictionary["email"] as? String


    }
    
    
}















//($query=null, $orderBy= 'id', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)

//********LIMIT 100*******

//($query=null, $orderBy= 'givenName', $orderDirection= 'ASC', $limit=100, $page=1, $stubResponses=true)