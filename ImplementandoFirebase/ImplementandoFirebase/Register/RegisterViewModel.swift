//
//  RegisterViewModel.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 17/08/24.
//

import Foundation
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
    func successRegister()
    func errorRegister(title: String, message: String)
    func loading(start: Bool)
}

class RegisterViewModel {
    
    weak var delegate: RegisterViewModelProtocol?
    
    func fetchRegister(email: String, password: String) {
        delegate?.loading(start: true)
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            delegate?.loading(start: false)
            
            guard error == nil else {
                delegate?.errorRegister(title: "Atenção!", message: error?.localizedDescription ?? "")
                return
            }
            
            delegate?.successRegister()
        }
    }
}
