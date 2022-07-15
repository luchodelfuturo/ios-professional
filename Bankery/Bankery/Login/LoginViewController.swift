//
//  ViewController.swift
//  Bankery
//
//  Created by Luciano Federico Castro on 13/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    // Elementos de la view aquí: podemos ordenarlos segun el orden de vista
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginView = LoginView()
    let signInbutton = UIButton(type: .system)
    let errorMessageLabel = UILabel() //Label para mostrar errores de Login
    
    
    // Definimos variables para guardar data del user y pass
    var username: String?{
        return loginView.usernameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController{
    private func style(){
        //Titulo & SubTitulo
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = "Bankey"
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = .systemIndigo
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLabel.adjustsFontSizeToFitWidth = true
        subTitleLabel.text = "Please Login and let's play"
        
        //Login View
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //Estilos del Boton:
        signInbutton.translatesAutoresizingMaskIntoConstraints = false
        signInbutton.configuration = .filled() //esto le da el diseño de fonto pintado
        signInbutton.configuration?.imagePadding = 8
        signInbutton.setTitle("Sign In", for: [])
        signInbutton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        //Label
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        
        
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInbutton)//acá agregamos el botón
        view.addSubview(errorMessageLabel) //agregamos el label
        
        //titulo y sub titulo
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 3),
            //sub title -> le agregamos margen desde el login view que lo separe multiplier 3
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 6),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        // button
        NSLayoutConstraint.activate([
            
            signInbutton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInbutton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),//esto copia los mismos margenes que Login View
            signInbutton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        // Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInbutton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInbutton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInbutton.trailingAnchor)
        ])
        
    }
}

extension LoginViewController{
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never  be nil")//no debería entrar en este error
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Lucho" && password == "Aviones"{
            signInbutton.configuration?.showsActivityIndicator = true //Animacion de Loading
        } else{
            configureView(withMessage: "Incorrect username / password")
        }
        
    }
    
    private func configureView(withMessage message:String){ //Argument Labels "withMessega" son las props
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}

