//
//  RegisterScreen.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 15/08/24.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?

    
    lazy var registerLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .black
      label.font = UIFont.boldSystemFont(ofSize: 28)
      label.text = "Crie sua conta"
      return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email:"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let pw = UITextField()
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.placeholder = "Senha:"
        pw.borderStyle = .roundedRect
        pw.keyboardType = .emailAddress
        pw.isSecureTextEntry = true
        return pw
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let pw = UITextField()
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.placeholder = "Confirme sua senha:"
        pw.borderStyle = .roundedRect
        pw.keyboardType = .emailAddress
        pw.isSecureTextEntry = true
        return pw
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(registerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
        addSubview(backButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.bottomAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 80),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 80),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
