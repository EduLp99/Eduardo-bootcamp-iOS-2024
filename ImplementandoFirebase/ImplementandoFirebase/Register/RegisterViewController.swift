//
//  RegisterViewController.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 15/08/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
    
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
