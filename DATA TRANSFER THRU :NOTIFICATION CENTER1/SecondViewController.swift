//
//  SecondViewController.swift
//  DATA TRANSFER THRU :NOTIFICATION CENTER1
//
//  Created by Syed.Reshma Ruksana on 23/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var mobileNumberTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate=self
        mobileNumberTF.delegate=self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmitBtnTap(_ sender: UIButton) {
        
        
        if((nameTF.text?.isEmpty)! || (mobileNumberTF.text?.isEmpty)!){
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
            
        }else
        {
            
            let dataDict = ["Name":nameTF.text!,"MobileNumber":mobileNumberTF.text!]
            
            NotificationCenter.default.post(name: NSNotification.Name("swift"), object: self, userInfo: dataDict)
            
            dismiss(animated: true, completion: nil)
        }
            
        }
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // SHOULD BEGIN EDITING
    var returnVal:Bool = false
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if(textField == nameTF)
        {
            returnVal = true
        }
        else if(textField == mobileNumberTF)
        {
            if(nameTF.text!.count>=2)
            {
                returnVal = true
            }else
            {
                returnVal = false
            }
        }
        return returnVal

    }
    //  DELEGATES FOR NAME
    
    func isValidForAlphabets(alphabets:String) -> Bool {
        let RegEx = "[A-Za-z ]{2,25}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: alphabets)
    }
    // PHONE NUMBER
    
    func isValidForNumbers(numbers:String) -> Bool {
        let RegEx = "[0-9 ]{9}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: numbers)
    }

    
    // SHOULD END EDITING

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
//        textField.backgroundColor=UIColor.yellow
        
        if(textField==nameTF)
        {
            returnVal = isValidForAlphabets(alphabets: textField.text!)
        }
        if(textField==mobileNumberTF)
        {
            returnVal = isValidForNumbers(numbers: textField.text!)
        }
        return returnVal
    }
    
}
