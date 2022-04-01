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
    
    @IBOutlet weak var loginButton: UIButton!
    var username = ""
    var password = ""
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefault.set("1234", forKey: "admin")
        userDefault.set("111", forKey: "customer")
        loginButton.layer.cornerRadius = CGFloat(10)
    }

    @IBAction func LoginPressed(_ sender: UIButton) {
        let userAlert = UIAlertController(title: "Error!", message: "User not found", preferredStyle: .alert)
        
        let passwordAlert = UIAlertController(title: "Error!", message: "Wrong password", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil) // handler -> butona basıldığında yapılacak işlem
        
        userAlert.addAction(okButton)
        passwordAlert.addAction(okButton)
        
        
        username = usernameTextField.text!
        password = passwordTextField.text!
        
        if let realPassword = userDefault.string(forKey: username){
            if realPassword == password{
                performSegue(withIdentifier: "goToSecondVC", sender: nil)
            }else{
                self.present(passwordAlert, animated: true, completion: nil)
            }
        }else{
        self.present(userAlert, animated: true, completion: nil)
        }}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.username = username
        }
    }

}

