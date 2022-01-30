//
//  PhotoCollectionVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit

final class PhotoCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "PhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "photoCollectionCell")
    }

    var userCollection = [
        UserModel(username: .Mark, userFamily: .Laletin, userPhoto: .MarkPhoto, userPhotoCollection: ["Active1","Active2"]),
        UserModel(username: .Jenny, userFamily: .Allen, userPhoto: .JennyPhoto, userPhotoCollection: ["Active3", "Active4"]),
        UserModel(username: .Amanda, userFamily: .Vilson, userPhoto: .AmandaPhoto, userPhotoCollection: ["Active5", "Active6","ActiveBolgariy"]),
        UserModel(username: .Rogers, userFamily: .Jones, userPhoto: .RogersPhoto, userPhotoCollection: ["ActiveNight1","ActiveKipr"]),
        UserModel(username: .Ariel, userFamily: .Theron, userPhoto: .ArielPhoto, userPhotoCollection: ["autumn","SnowFreinds","People"])
    ]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath) as? PhotoCollectionCell
        else {
            return UICollectionViewCell()
        }
    
       // let photo = userCollection[indexPath.row]
        
        for indexUser in 0...userCollection[indexPath.row].userPhotoCollection.count-1 {
            cell.configure(photo: UIImage(named: userCollection[indexPath.row].userPhotoCollection[indexUser]))
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
