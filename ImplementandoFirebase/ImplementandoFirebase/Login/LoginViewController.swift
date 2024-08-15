//
//  ViewController.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 12/08/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Deu Erro -> \(error.localizedDescription)")
                return
            }
            
            print("Login feito com sucesso")
            
        }
    }
}
