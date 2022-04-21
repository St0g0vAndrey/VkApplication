//
//  FullPhotoVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 09.02.2022.
//

import UIKit
import Kingfisher

class FullPhotoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fullPhotoUser.kf.setImage(with: URL(string: fullPhotoArray[indexImage]))
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var fullPhotoUser: UIImageView!
//    @IBOutlet weak var fullPhotoUser: UIImageView!

    var fullPhotoArray = [String]()
    var indexImage: Int = 0
    var image: String = ""
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
