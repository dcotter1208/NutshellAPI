//
//  NetworkOperation.swift
//  NutshellAPI
//
//  Created by Donovan Cotter on 12/1/15.
//  Copyright © 2015 DonovanCotter. All rights reserved.
//

import Foundation

//We created a class to handle the Network operation because 

class NetworkOperation {
    
    //Lazy loading is something new but going through the tutorials I've learned that it defers the initialization of an object until we need it. This helps free up memory.
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDicionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDicionaryCompletion) {
        
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            print(data)
            //1. Check HTTP Response for successful GET request.
            if let httpResponse = response as? NSHTTPURLResponse {
            
                switch httpResponse.statusCode {
                    case 200:
                        
                    //2. Create JSON object with data.
                        let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data!, options: [])) as? [String: AnyObject]
                        completion(jsonDictionary)
                    default:
                    print("GET request not successful. HTTP status code: \(httpResponse)")
                
                }
            
            } else {
                print("Error: Not a valid HTTP response")
            }

        }
        
        dataTask.resume()
    
    }
    
    
}