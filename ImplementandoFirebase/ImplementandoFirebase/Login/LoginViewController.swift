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
    var viewModel: LoginViewModel = LoginViewModel()
    var registerVC: RegisterViewController = RegisterViewController()
    var loading: Loading?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        viewModel.delegate = self
        loading = Loading(viewController: self)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        guard let email: String = screen?.emailTextField.text,
              let password: String = screen?.passwordTextField.text,
              !email.isEmpty,
              !password.isEmpty else {
            showAlert(title: "Atenção!", message: "Por favor, preencha todos os campos")
            return
        }
        
        viewModel.fetchLogin(email: email, password: password)
    }
    
    
    
    func tappedRegisterButton() {
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func loading(start: Bool) {
        if start {
            loading?.start(message: "Carregando...")
        } else {
            loading?.stop()
        }
    }
    
    func successLogin() {
        print("Showw, login feito com sucesso!")
    }
    
    func errorLogin(title: String, message: String) {
        showAlert(title: title, message: message)
    }
}
