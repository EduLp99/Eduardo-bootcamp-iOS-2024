//
//  Tela02ViewController.swift
//  DesafioTransitandoInformacoesEntreTelas
//
//  Created by Eduardo Felipe das Neves Abido on 17/07/24.
//

import UIKit

class Tela02ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    let value1: String
    let value2: String

    init?(coder: NSCoder, value1: String, value2: String) {
      self.value1 = value1
      self.value2 = value2
      super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
      super.viewDidLoad()
        let soma = (Int(value1) ?? 0) + (Int(value2) ?? 0)
        
        valueLabel.text = String(soma)
    }

}
