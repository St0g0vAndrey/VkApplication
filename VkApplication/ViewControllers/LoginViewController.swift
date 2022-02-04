//
//  ViewController.swift
//  VkApplication
//
//  Created by Андрей Стогов on 18.12.2021.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var PasswTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var labelProgress1: UILabel!
    @IBOutlet weak var labelProgress2: UILabel!
    @IBOutlet weak var labelProgress3: UILabel!
    
    @IBAction func LoginProcess(_ sender: Any) {
    }
    @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) {
    }
    
    
    // MARK: - Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                    target: self,
                    action: #selector(hideKeyboard)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    //MARK: - Action
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "goToMain":
            if !UserProcess() {
                //animate()
                ErroAlert()
                return false
            } else {
                //animate()
                ClearUsers()
                return true
            }
        default:
            return false
        }
    }
    
    // MARK: - Private
    private func UserProcess () -> Bool {
        userTextField.text == "" && PasswTextField.text == ""
    }
    
    private func ErroAlert () {
        let alertProcess = UIAlertController(title: "Error", message: "Uncorect user name or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alertProcess.addAction(action)
        self.present(alertProcess, animated: true)
    }
    
    private func ClearUsers () {
        userTextField.text = ""
        PasswTextField.text = ""
    }
    
    //MARK: - Animate
    
    func animate() {
        view.layoutIfNeeded()
        UIView.animate(
            withDuration: 4.0,
            delay: 0.4,
            options: [
                .curveEaseInOut,
                .repeat,
                .autoreverse
            ]) {
                self.labelProgress1.alpha = 0.0
                self.view.layoutIfNeeded()
            } completion: { isCompleted in
                self.labelProgress1.alpha = 1.0
                self.view.layoutIfNeeded()
            }

    }
    
    
    
}

