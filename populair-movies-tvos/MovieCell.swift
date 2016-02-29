//
//  MovieCell.swift
//  populair-movies-tvos
//
//  Created by Koen Vendrik on 29/02/16.
//  Copyright © 2016 Koen Vendrik. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
    
    func configureCell(movie: Movie) {
        
        print(movie.title)
        print(movie.posterPath)
        
        if let title = movie.title {
            movieLbl.text = title
        }
        
        if let path = movie.posterPath {
            let url = NSURL(string: path)!
            
            print(url)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                let data = NSData(contentsOfURL: url)!
                
                dispatch_async(dispatch_get_main_queue()){
                    let img = UIImage(data: data)
                    self.movieImg.image = img
                }
            }
        }
        
    }
}
