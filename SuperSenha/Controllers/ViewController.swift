//
//  ViewController.swift
//  SuperSenha
//
//  Created by Vinicius on 14/03/20.
//  Copyright © 2020 Vinicius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "generatePassword" {
            if(!swNumbers.isOn && !swCaptitalLetters.isOn && !swLetters.isOn && !swSpecialCharacters.isOn){
                
                let alert = UIAlertController(title: "Ação não permitida", message: "Favor marcar pelo menos um dos seletores", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                    }}))
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
            let passwordsViewController = segue.destination as! PasswordViewController
            
            // forma mais segura (usar if let)
            if let numberOfPasswords = Int(tfTotalPasswords.text!) {
                // se conseguir obter o valor do campo e converter para inteiro
                passwordsViewController.numberOfPasswords = numberOfPasswords
            }
            if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
                passwordsViewController.numberOfCharacters = numberOfCharacters
            }
            passwordsViewController.useNumbers = swNumbers.isOn
            passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
            passwordsViewController.useLetters = swLetters.isOn
            passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
            
            // forcar encerrar o modo de edicao // remove o foco e libera teclado
            view.endEditing(true)
                
            }
        }
    }
}

