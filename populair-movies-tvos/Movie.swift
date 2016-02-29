//
//  Movie.swift
//  populair-movies-tvos
//
//  Created by Koen Vendrik on 29/02/16.
//  Copyright © 2016 Koen Vendrik. All rights reserved.
//

import Foundation

class Movie {
    let URL_BASE = "http://image.tmdb.org/t/p/w500"
    
    var title: String!
    var overview: String!
    var posterPath: String!
    
    init(movieDict: Dictionary<String, AnyObject>) {
        
        if let title = movieDict["title"] as? String {
            self.title = title
        }
        
        if let overview = movieDict["overview"] as? String {
            self.overview = overview
        }
        
        if let path = movieDict["poster_path"] as? String {
            self.posterPath = "\(URL_BASE)\(path)"
        }
        
    }
}