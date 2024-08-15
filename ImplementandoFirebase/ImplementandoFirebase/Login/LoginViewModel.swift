//
//  LoginViewModel.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 15/08/24.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
  func successLogin()
  func errorLogin(title: String, message: String)
}

class LoginViewModel {

  weak var delegate: LoginViewModelProtocol?

  func fetchLogin(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
      guard let self else { return }

      // Opção 1
      guard error == nil else {
        delegate?.errorLogin(title: "Atenção!", message: error?.localizedDescription ?? "")
        return
      }

      // Opção 2
      //      if let error = error {
      //        print("deu ruim mesmo -> \(error.localizedDescription)")
      //        return
      //      }

      delegate?.successLogin()
    }
  }

}
