//
//  Loading.swift
//  ImplementandoFirebase
//
//  Created by Eduardo Felipe das Neves Abido on 03/09/24.
//

import Foundation
import UIKit

class Loading {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
       let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.color = .white
        loading.style = .large
        loading.backgroundColor = .black
        loading.clipsToBounds = true
        loading.layer.cornerRadius = 10
        return loading
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func start(message: String) {
        addElements()
    }
    
    func addElements() {
        containerView.addSubview(activityIndicatorView)
        containerView.addSubview(messageLabel)
        viewController.view.addSubview(containerView)
    }
    
    func configConstraits() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
