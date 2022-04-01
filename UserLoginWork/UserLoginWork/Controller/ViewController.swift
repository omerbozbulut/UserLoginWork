//
//  ViewController.swift
//  UserLoginWork
//
//  Created by omer faruk bozbulut on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username = ""
    var password = ""
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefault.set("1234", forKey: "admin")
        userDefault.set("111", forKey: "customer")
    }

    @IBAction func LoginPressed(_ sender: UIButton) {
        username = usernameTextField.text!
        password = passwordTextField.text!
        
        if let realPassword = userDefault.string(forKey: username){
            if realPassword == password{
                performSegue(withIdentifier: "goToSecondVC", sender: nil)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.username = username
        }
    }
    
    
    
    

}

