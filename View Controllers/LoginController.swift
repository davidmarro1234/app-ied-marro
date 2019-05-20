//
//  LoginController.swift
//  David Marro
//
//  Created by David Marro on 01/04/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    //MARK:  - Outlets
    
    @IBOutlet weak var textEmail: UITextField!
    
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonAccedi: UIButton!
    
    
    
    //MARK:  - Setup della schermata

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // arrotondamento angoli text mail
        textEmail.layer.cornerRadius = 20.0
        textEmail.layer.masksToBounds = true

        // arrotondamento angoli text password - circolare e dinamico in base all altezza
        
        textPassword.layer.cornerRadius = textPassword.frame.size.height / 2.0
        textPassword.layer.masksToBounds = true
        
        
        textEmail.layer.borderWidth = 1.0
        textEmail.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    //MARK:  - Actions


    
    @IBAction func buttonLogin(_ sender: Any) {
       if textEmail.text == "davidmarro@gmail.com"
       {
        if textPassword.text == "david"
        {
            print("Accesso Eseguito")
            performSegue(withIdentifier: "vaiAllaHome", sender: self)
        }
        }
        
    }
    
    
}
