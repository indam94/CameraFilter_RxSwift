//
//  ViewController.swift
//  CameraFilter
//
//  Created by DONGGUN LEE on 9/17/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navController = segue.destination as? UINavigationController,
            let photosController = navController.viewControllers.first as? PhotosCollectionViewController else{
                fatalError("Segue Destination not found")
        }
        photosController.selectedPhoto.subscribe(onNext: {[weak self] photo in
            
            self?.photoImageView.image = photo
            
        }).disposed(by: disposeBag)
        
    }

}

