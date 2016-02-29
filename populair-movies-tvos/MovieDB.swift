//
//  MovieDB.swift
//  populair-movies-tvos
//
//  Created by Koen Vendrik on 29/02/16.
//  Copyright © 2016 Koen Vendrik. All rights reserved.
//

import UIKit

class MovieDB {
    
    let API_BASE = "http://api.themoviedb.org/3/movie"
    let API_KEY = "431765c61508f0b0fee87fd4a6c8edd8"
    
    private func constructApiUrl(endpoint: String) -> String {
        return "\(API_BASE)\(endpoint)?api_key=\(API_KEY)"
    }
    
    private func getJSON(endpoint: String, completionHandler: ([Dictionary<String, AnyObject>]) -> Void) {
        print(constructApiUrl(endpoint))
        let url = NSURL(string: constructApiUrl(endpoint))!
        let request = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){ (data, response, error) ->
            Void in
            
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                    let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Dictionary<String, AnyObject>
                    
                    if let results = dict!["results"] as? [Dictionary<String, AnyObject>] {
                        completionHandler(results)
                    }
                } catch {
                    
                }
            }
        }
        
        task.resume()
    }
    
    func getPopular(completionHandler: ([Dictionary<String, AnyObject>]) -> Void) {
        getJSON("/popular") {
            results in
            completionHandler(results)
        }
    }
    
}
