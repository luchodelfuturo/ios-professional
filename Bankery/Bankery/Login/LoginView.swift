//
//  LoginView.swift
//  Bankery
//
//  Created by Luciano Federico Castro on 13/07/2022.
//

import Foundation
import UIKit

class LoginView:UIView{
    
    //aca agregamos los elementos
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    //Un divisor es una view, por lo que hay que crearla
    let divideView = UIView();
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("inite(coder:) has not been implemented")
    }
    //Como ya tenemos un stack view esto no lo necesitamos más
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width:200, height:200)
//    }
    
}

    extension LoginView {
        //acá aplicamos estilos
        func style(){
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .secondarySystemBackground
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 8
            
            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            usernameTextField.placeholder = "Username"
            usernameTextField.delegate = self
            
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.placeholder = "Password"
            passwordTextField.isSecureTextEntry = true
            passwordTextField.delegate = self
            
            //le damos estilos a divideView
            divideView.translatesAutoresizingMaskIntoConstraints = false
            divideView.backgroundColor = .secondarySystemFill
            
//              Le damos Bordes redonditos aplicandole al layer
            layer.cornerRadius = 5
            clipsToBounds = true
            
            
        }
        //acá aplicamos Constraints
        func layout(){
            stackView.addArrangedSubview(usernameTextField)
            stackView.addArrangedSubview(divideView) //Depende donde lo agreguemos en el stack view, se ve primero...
            stackView.addArrangedSubview(passwordTextField)
            
            addSubview(stackView)
//            Acá activamos los contrainst para todo un stackView
            NSLayoutConstraint.activate([
               stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
                trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
               bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
            ])
            
            divideView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
   
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
