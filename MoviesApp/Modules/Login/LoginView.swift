//
//  LoginView.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import UIKit

protocol LoginUI: AnyObject {
    func showError()
}

class LoginView: UIViewController {
    
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    private let presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTxt.delegate = self
        passwordTxt.delegate = self
    }

    @IBAction func login(_ sender: Any) {
        presenter.onTapLogin(user: userTxt.text ?? "", password: passwordTxt.text ?? "")
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}

extension LoginView: LoginUI {
    
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "Usuario o contraseña incorrecta", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
