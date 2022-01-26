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
        UserModel(username: "Mark", userFamily: "Laletin", userPhoto: "Boy1.jpg", userPhotoCollection: ["Active1","Active2"]),
        UserModel(username: "Jenny", userFamily: "Allen", userPhoto: "Woomen3.jpg", userPhotoCollection: ["Active3", "Active4"]),
        UserModel(username: "Amanda", userFamily: "Vilson", userPhoto: "Woomen1.jpg", userPhotoCollection: ["Active5", "Active6","ActiveBolgariy"]),
        UserModel(username: "Rogers", userFamily: "Jones", userPhoto: "Boy2.jpg", userPhotoCollection: ["ActiveNight1","ActiveKipr"]),
        UserModel(username: "Ariel", userFamily: "Theron", userPhoto: "Woomen2.jpg", userPhotoCollection: ["autumn","SnowFreinds","People"])
    ]
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

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
