//
//  NutshellService.swift
//  NutshellAPI
//
//  Created by Donovan Cotter on 12/1/15.
//  Copyright © 2015 DonovanCotter. All rights reserved.
//

import Foundation

struct NutshellService {
    
    //We use a closure here because inside of the method we are going to call the download JSON method of our Network Operation. This makes an async call. We can't return an object from inside the closure. So we can't just return the data we need unless we implment the callback through a closure. We are also returning Contact as an optional because our network connection could fail and we need to return nil if this happens.
    func getContacts(completion: (Contact? -> Void)) {
        
        if let nutshellsURL = NSURL(string: "https://app01.nutshell.com/api/v1/json") {
            let networkOperation = NetworkOperation(url: nutshellsURL)
            
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                //we want to parse the dictionary and create a populated instance of Contact.
                let contact = self.contactFromJSON(JSONDictionary)
                completion(contact)
                
                
            }
            
        } else {
            print("Could not construct a valid URL")
        
        }

    }
    
    func contactFromJSON(jsonDictionary: [String: AnyObject]?) -> Contact? {
        if let contactDictionary = jsonDictionary?["methods"] as? [String: AnyObject] {
            return Contact(contactDictionary: contactDictionary)
        
        } else {
            print("JSON Dictionary returned nil for the findContacts key")
            return nil
        }
        
        
    }
    
    
}

//($query=null, $orderBy= 'givenName', $orderDirection= 'ASC', $limit=100, $page=1, $stubResponses=true)