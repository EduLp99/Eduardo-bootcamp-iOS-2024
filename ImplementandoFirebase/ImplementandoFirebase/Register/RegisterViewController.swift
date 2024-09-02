//
//  RegisterViewController.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 15/08/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        viewModel.delegate = self
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        guard let email: String = screen?.emailTextField.text,
              let password: String = screen?.passwordTextField.text,
              let confirmPassword: String = screen?.confirmPasswordTextField.text,
              !email.isEmpty,
              !password.isEmpty,
              !confirmPassword.isEmpty && password == confirmPassword else {
            showAlert(title: "Atenção!", message: "Por favor, preencha todos os campos")
            return
        }
        
        guard password == confirmPassword else {
            showAlert(title: "Atenção!", message: "Campo de senha e confirmar senha devem ser iguais")
            return
        }
        
        viewModel.register(email: email, password: password)
    }
}

extension RegisterViewController: RegisterViewModelProtocol {
    func successRegister() {
        print("Showw, cadastro feito com sucesso!")
    }
    
    func errorRegister(title: String, message: String) {
        showAlert(title: title, message: message)
    }
}

