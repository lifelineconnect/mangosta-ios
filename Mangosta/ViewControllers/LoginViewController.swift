//
//  LoginViewController.swift
//  Mangosta
//
//  Created by Tom Ryan on 3/21/16.
//  Copyright © 2016 Inaka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	@IBOutlet private var jidField: UITextField!
	@IBOutlet private var passwordField: UITextField!
	@IBOutlet private var serverNameField: UITextField!
	var loginDelegate: LoginControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func logIn(sender: AnyObject?) {
		if let serverText = self.serverNameField.text {
			let auth = AuthenticationModel(jidString: self.jidField.text!, serverName: serverText, password: self.passwordField.text!)
			auth.save()
		}
		let auth = AuthenticationModel(jidString: self.jidField.text!, password: self.passwordField.text!)
		auth.save()
		
		//StreamManager.manager.begin() { finished in
			self.loginDelegate?.didLogIn()
			self.dismissViewControllerAnimated(true, completion: nil)
		//}
	}
}

protocol LoginControllerDelegate {
	func didLogIn()
}