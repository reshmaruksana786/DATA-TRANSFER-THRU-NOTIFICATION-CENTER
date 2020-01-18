//
//  ViewController.swift
//  DATA TRANSFER THRU :NOTIFICATION CENTER1
//
//  Created by Syed.Reshma Ruksana on 23/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
//    var details = String()
//    
//    var allContactDetails = [String]()
//    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(eventHandler), name: NSNotification.Name("swift"), object: nil)
        

        // Do any additional setup after loading the view, typically from a nib.
    }


   


    @IBAction func addContactsBtn(_ sender: UIButton) {
        
        let target = self.storyboard?.instantiateViewController(withIdentifier: "secondVC")
        
        
        self.present(target!, animated: true, completion: nil)
        
    }
    
    
    @objc func eventHandler(data:Notification)
    {
        
        
        label.text = data.userInfo!["Name"]! as! String
        label2.text = data.userInfo!["MobileNumber"]! as! String
        
    }
}

