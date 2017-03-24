//
//  PostLoginViewController.swift
//  Tableto
//
//  Created by Ishan Gupta on 3/18/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit

class PostLoginViewController:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    lazy var drugSearchBar : UISearchBar = {
        var sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        
        return sb
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(drugSearchBar)
        navigationItem.title = "Home"
        //   navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
     
        
        setupDrugSearchBar()
        //        setupMenuBar()   // calling the menubar initialization code
        
        
    }
    
    func setupDrugSearchBar(){
        drugSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        drugSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 65 ).isActive = true
        drugSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        drugSearchBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt cellForItemAtindexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: cellForItemAtindexPath)
        
        cell.backgroundColor = UIColor.magenta
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return
            
            
            
            CGSize(width: view.frame.width, height: 100)
        
        
        
        //  CGRect(x: 0, y: 0, width: 100, height: 200)
        
    }
    
}
