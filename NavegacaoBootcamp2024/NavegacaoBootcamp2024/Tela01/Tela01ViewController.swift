//
//  ViewController.swift
//  NavegacaoBootcamp2024
//
//  Created by Eduardo Felipe das Neves Abido on 15/07/24.
//

import UIKit

class Tela01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedShowScreenButton(_ sender: UIButton) {
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController")
        tela02.modalPresentationStyle = .fullScreen
        
        present(tela02, animated: true)
    }
    
}

