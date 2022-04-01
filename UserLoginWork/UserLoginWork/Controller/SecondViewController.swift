//
//  SecondViewController.swift
//  UserLoginWork
//
//  Created by omer faruk bozbulut on 31.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username
    }
    
    


}
