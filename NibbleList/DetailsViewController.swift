//
//  DetailsViewController.swift
//  NibbleList
//
//  Created by Herman Kwan on 1/24/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var markLabel: UIImageView!
    @IBOutlet weak var puppyImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        markLabel.image = UIImage(named: currentFoodList[myIndex].image.rawValue)
        textLabel.text = currentFoodList[myIndex].title
        descLabel.text = currentFoodList[myIndex].desc
        
        if markLabel.image == UIImage(named: "xMark") {
            textLabel.textColor = UIColor(red: 206/255.0, green: 46/255.0, blue: 0/255.0, alpha: 1.0)
            puppyImage.image = UIImage(named: "Sad Puppy")
        } else if markLabel.image == UIImage(named: "checkMark") {
            puppyImage.image = UIImage(named: "Happy Puppy") 
        }
    }
}
