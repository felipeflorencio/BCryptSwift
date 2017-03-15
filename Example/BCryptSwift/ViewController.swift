//
//  ViewController.swift
//  BCryptSwift
//
//  Created by Felipe Florencio Garcia on 3/14/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//
// Originally created by Joe Kramer https://github.com/meanjoe45/JKBCrypt
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import BCryptSwift

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l >= r
    default:
        return !(lhs < rhs)
    }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l <= r
    default:
        return !(rhs < lhs)
    }
}


class ViewController: UIViewController {
    
    // MARK: - Property List
    
    @IBOutlet weak var hashLabelField: UITextField!
    @IBOutlet weak var hashInputTextField: UITextField!
    @IBOutlet weak var saltInputTextField: UITextField!
    @IBOutlet weak var compareLabelField: UITextField!
    @IBOutlet weak var compareInputTextField: UITextField!
    
    // MARK: - Action Methods
    
    @IBAction func generateSaltPressed() {
        self.hashLabelField.text = self.generateSalt()
    }
    
    @IBAction func createHashPressed() {
        if let hash = BCryptSwift.hashPassword(self.hashInputTextField.text!, withSalt: self.generateSalt()) {
            self.hashLabelField.text = hash
        }
        else {
            self.hashLabelField.text = "Hash generation failed"
        }
    }
    
    @IBAction func compareHashPressed() {
        if let compare = BCryptSwift.verifyPassword(self.compareInputTextField.text!, matchesHash:self.hashLabelField.text!) {
            if compare {
                self.compareLabelField.text = "The phrase was a SUCCESS!"
            }
            else {
                self.compareLabelField.text = "Compare phrase does NOT match hashed value"
            }
        }
        else {
            self.compareLabelField.text = "Compare hash generation failed"
        }
    }
    
    @IBAction func hideKeyboard() {
        self.hashInputTextField.resignFirstResponder()
        self.saltInputTextField.resignFirstResponder()
        self.compareInputTextField.resignFirstResponder()
    }
    
    // MARK: - Internal Methods
    
    func generateSalt() -> String {
        let rounds : Int? = Int(self.saltInputTextField.text!)
        
        var salt : String
        if rounds != nil && rounds >= 4 && rounds <= 31 {
            salt = BCryptSwift.generateSaltWithNumberOfRounds(UInt(rounds!))
        }
        else {
            salt = BCryptSwift.generateSalt()
        }
        
        return salt
    }
}


