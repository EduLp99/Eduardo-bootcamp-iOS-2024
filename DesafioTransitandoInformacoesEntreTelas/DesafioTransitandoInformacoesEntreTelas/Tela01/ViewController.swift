//
//  ViewController.swift
//  DesafioTransitandoInformacoesEntreTelas
//
//  Created by Eduardo Felipe das Neves Abido on 17/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstValueTextField: UITextField!
    @IBOutlet weak var secondValueTextField: UITextField!
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .orange
      configElements()
    }

    func configElements() {
      firstValueTextField.placeholder = "Digite o valor 1:"
      firstValueTextField.delegate = self

      secondValueTextField.placeholder = "Digite o valor 2:"
      secondValueTextField.delegate = self
    }

    @IBAction func tappedSumButton(_ sender: UIButton) {
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(identifier: "Tela02ViewController") { coder -> Tela02ViewController? in
            let value1: String = self.firstValueTextField.text ?? ""
            let value2: String = self.secondValueTextField.text ?? ""
            
           return Tela02ViewController(coder: coder, value1: value1, value2: value2)
        }

        navigationController?.pushViewController(tela02, animated: true)
      }
}

extension ViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

}
