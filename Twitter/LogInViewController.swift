//
//  LogInViewController.swift
//  Twitter
//
//  Created by admin on 3/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBAction func onLogInButton(_ sender: Any)
    {
        let myUrl = "https://api.twitter.com/oauth/request_token";
              
              TwitterAPICaller.client?.login(url: myUrl, success: {
                
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                  //code to run if someone logs in successfully
                  self.performSegue(withIdentifier: "logInToHome", sender: self)
                  
              }, failure: { (Error) in
                  print("Could Not Log In")
              })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true
        {
            self.performSegue(withIdentifier: "logInToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
