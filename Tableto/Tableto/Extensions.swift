//
//  Extensions.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/3/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(urlString: String){
        
        self.image = nil
        
        //check cache for image
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject){
            self.image = cachedImage as! UIImage
            return
        }
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if(error != nil){
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!){
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                     self.image = downloadedImage
                }
               
                //         cell.imageView?.image = UIImage(data: data!)
            }
            
            
        }).resume()

    }
}
