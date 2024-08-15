//
//  LoginScreen.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 12/08/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Seja bem vindo!"
        label.font = UIFont.boldSystemFont(ofSize: 28)
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
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var secondLoginlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ou continue com"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        return label
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Wrapper"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Shape"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        return button
    }()
    
    @objc func tappedLoginButton() {
        delegate?.tappedLoginButton()
    }
    
    lazy var registerButton: UIButton = {
      let button = UIButton(type: .system)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle("Não tem conta? Cadastre-se", for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
      button.setTitleColor(.systemBlue, for: .normal)
      button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
      return button
    }()

    @objc func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
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
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(secondLoginlabel)
        addSubview(googleButton)
        addSubview(facebookButton)
        addSubview(registerButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondLoginlabel.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            secondLoginlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            secondLoginlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            secondLoginlabel.heightAnchor.constraint(equalToConstant: 40),
            
            googleButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -30),
            googleButton.centerYAnchor.constraint(equalTo: secondLoginlabel.bottomAnchor, constant: 50),
            googleButton.widthAnchor.constraint(equalToConstant: 80),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            facebookButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 30),
            facebookButton.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor),
            facebookButton.widthAnchor.constraint(equalToConstant: 80),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 40),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
}
