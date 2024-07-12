//
//  ViewController.swift
//  Desafio-Teste-Login
//
//  Created by Eduardo Felipe das Neves Abido on 11/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyePasswordImage: UIImageView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var eyeConfirmPasswordImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    func configElements() {
     welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)

      emailTextField.placeholder = "Digite seu email:"
      emailTextField.keyboardType = .emailAddress
      emailTextField.autocorrectionType = .no
      emailTextField.delegate = self
      emailTextField.layer.borderColor = UIColor.lightGray.cgColor
      emailTextField.layer.borderWidth = 1

      passwordTextField.placeholder = "Digite sua senha:"
      passwordTextField.autocorrectionType = .no
      passwordTextField.isSecureTextEntry = true
      passwordTextField.delegate = self
      passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
      passwordTextField.layer.borderWidth = 1
        
      confirmPasswordTextField.placeholder = "Confirme sua senha:"
      confirmPasswordTextField.autocorrectionType = .no
      confirmPasswordTextField.isSecureTextEntry = true
      confirmPasswordTextField.delegate = self
      confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
      confirmPasswordTextField.layer.borderWidth = 1

      loginButton.setTitle("Login", for: .normal)
      loginButton.clipsToBounds = true
      loginButton.layer.cornerRadius = 16
      isEnabledLoginButton(isEnable: false)
        
      eyePasswordImage.image = UIImage(systemName: "eye.slash")
      eyeConfirmPasswordImage.image = UIImage(systemName: "eye.slash")


    }
    
    func isEnabledLoginButton(isEnable: Bool) {
      loginButton.isEnabled = isEnable
      loginButton.backgroundColor = isEnable ? .systemBlue : .lightGray
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = ".{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }

}

extension ViewController: UITextFieldDelegate {
    
      func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
      }
    
      func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.lightGray.cgColor
      }

   
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
      }

      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if isValidEmail(emailTextField.text ?? "") && isValidPassword(passwordTextField.text ?? "") && isValidPassword(confirmPasswordTextField.text ?? "") {
            isEnabledLoginButton(isEnable: true)
          } else {
            isEnabledLoginButton(isEnable: false)
          }
        }
        return false
      }
}
