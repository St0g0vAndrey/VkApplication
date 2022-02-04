//
//  TestVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 05.02.2022.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet weak var labelProgress1: UILabel!
    @IBOutlet weak var labelProgress2: UILabel!
    @IBOutlet weak var labelProgress3: UILabel!
    
    @IBAction func buttonPrecess(_ sender: UIButton) {
        animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let duration = 1.5
    let delay = 0.2
    
    func animate() {
        view.layoutIfNeeded()
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [
                .curveEaseInOut,
                .repeat,
                .autoreverse
            ]) {
                self.labelProgress1.alpha = 0.0
                self.view.layoutIfNeeded()
            } completion: { [self] isCompleted in
                self.labelProgress1.alpha = 1.0
                self.view.layoutIfNeeded()
                UIView.animate(
                    withDuration: self.duration,
                    delay: delay,
                    options: [
                        .curveEaseInOut,
                        .repeat,
                        .autoreverse
                    ]) {
                        self.labelProgress2.alpha = 0.0
                        self.view.layoutIfNeeded()
                    } completion: { isCompleted in
                        self.labelProgress2.alpha = 1.0
                        self.view.layoutIfNeeded()
                    }

            }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
