//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by DONGGUN LEE on 9/17/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import Photos

class PhotosCollectionViewController : UICollectionViewController{
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePhotos()
    }
    
    private func populatePhotos(){
        
        PHPhotoLibrary.requestAuthorization{
            [weak self] status in
            
            if status == .authorized{
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options:  nil)
                
                assets.enumerateObjects{
                    (object, count, stop) in
                    
                    self?.images.append(object)
                }
                
                self?.images.reverse()
                
            }
        }
    
    }
}
