//
//  LogInVc.swift
//  JiraApp
//
//  Created by ranjansahu on 17/07/17.
//  Copyright © 2017 Ranvijay. All rights reserved.
//

import UIKit
import Contacts

class LogInVc: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var userIdTf : UITextField!
    @IBOutlet weak var passwordTf : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Log in button clicked
    @IBAction func loginBtn(_sender:UIButton){
        
        self.authenticateUser()
        
    }
    
    //Email password format checking
    func emailPasswordValid() -> Bool
    {
        var isValid:Bool = true
        if(self.userIdTf.text == "" || self.passwordTf.text == ""){
            Utility.createAlertView(MSG_BLANK_USERNAME_PASSWORD, andTitle: "", buttonTitle: "OK", controllerObject: self)
            isValid = false
        }
        else if(!(Utility .isEmailValid((self.userIdTf.text)!))){
            Utility.createAlertView(MSG_INCORRECT_EMAIL, andTitle: "", buttonTitle: "OK", controllerObject: self)
            isValid = false
        }
        return isValid
    }
    
    
    //Authenticating user with email and password
    func authenticateUser()  {
        
        
        if (emailPasswordValid()) {
            Utility.showActivityIndicatorWithMsg(MSG_PLEASE_WAIT)

            self.goToHomePage()
        }
    }
    
    func goToHomePage(){
        Utility.hideActivityIndicator()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! Homevc
        self.navigationController?.pushViewController(nextViewController, animated: true)
        //self.push(nextViewController, animated:true, completion:nil)
    }
    //MARK :- Text field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        userIdTf .resignFirstResponder()
        passwordTf.resignFirstResponder()
        return true
        
    }
//    func dismissKeyboard() {
//        userIdTf.resignFirstResponder()
//        passwordTf.resignFirstResponder()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
