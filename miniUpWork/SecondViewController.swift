//
//  SecondViewController.swift
//  miniUpWork
//
//  Created by Аркадий Жуков on 26.01.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        emailTF.delegate = self
        phoneNumberTF.delegate = self
        priceTF.delegate = self
    }
    
    func isValidEmail(testStr:String) -> Bool {
            print("validate emailId: \(testStr)")
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
            return result
        }
    func isValidPhoneNumber(testStr:String) -> Bool {
        print("validate phoneId: \(testStr)")
        let phoneRegEx = "^[1-9]+[0-9]*$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
    let result = phoneTest.evaluate(with: testStr)
        return result
    }
    func isValidPrice(testStr:String) -> Bool {
        print("validate price: \(testStr)")
        let priceRegEx = "^[1-9]+[0-9]*$"
        let priceTest = NSPredicate(format:"SELF MATCHES %@", priceRegEx)
    let result = priceTest.evaluate(with: testStr)
        return result
    }
    func TFdidFill(testTF:UITextField) -> Bool {
        if nameTF.hasText && emailTF.hasText && phoneNumberTF.hasText{
            sendButton.isUserInteractionEnabled = true
        } else { return false }
        return true
    }
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var labelValidationMessage: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    @IBOutlet weak var priceTF: UITextField!
    
    @IBAction func backButton(_ sender: UIButton) {
    
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if nameTF.text!.isEmpty || emailTF.text!.isEmpty || phoneNumberTF.text!.isEmpty || priceTF.text!.isEmpty {
            labelValidationMessage.text = "Заполните все поля."
            return
        }
        if nameTF.hasText && emailTF.hasText && phoneNumberTF.hasText && priceTF.hasText{
            self.performSegue(withIdentifier: "unwindSegue", sender: nil)
            return
        }
        guard nameTF.text?.isEmpty == false else { return }
        if let _ = Double(nameTF.text!){
            let alert = UIAlertController(title: "Предупреждение", message: "Имя введено некорректно.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        guard emailTF.text?.isEmpty == false else { return }
        if isValidEmail(testStr: emailTF.text!) == false{
            print(isValidEmail(testStr: emailTF.text!))
            let alert = UIAlertController(title: "Предупреждение", message: "Эл. почта введена некорректно.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        guard phoneNumberTF.text?.isEmpty == false else { return }
        if isValidPhoneNumber(testStr: phoneNumberTF.text!) == false{
            print(isValidPhoneNumber(testStr: phoneNumberTF.text!))
            let alert = UIAlertController(title: "Предупреждение", message: "Телефон введён некорректно.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)

        }
        if priceTF.text?.isEmpty == true{
            let alert = UIAlertController(title: "Предупреждение", message: "Цена не была введена.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
