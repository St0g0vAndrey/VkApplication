//
//  PhotoCollectionVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit

class PhotoCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(
            nibName: "PhotoCollectionCell",
            bundle: nil),
            forCellWithReuseIdentifier: "photoCollectionCell")
        
        networkService.featchUserPhoto(userId) { [weak self] result in
            switch result {
            case .success(let photo):
                self?.userCollection = self?.photoSize(photo, "min") ?? []
                self?.userFullCollection = self?.photoSize(photo, "max") ??  []
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var userId: Int = 0
    private let networkService = NetworkServicePhoto()
    var userFullCollection = [String]()
    var userCollection = [String]() {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showCollectionFull",
              let destination = segue.destination as? FullPhotoVC,
              let photoVC = segue.source as? PhotoCollectionVC,
              let indexPhotoFull = photoVC.collectionView.indexPathsForSelectedItems?.last?.row
        else { return }
        destination.fullPhotoArray = userFullCollection
        destination.indexImage = indexPhotoFull
//        destination.image = userFullCollection[indexItems]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var user: Int = 0
        if userCollection.count != 0 {
            user = userCollection.count
        }
        return user
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath) as? PhotoCollectionCell
        else { return UICollectionViewCell() }
        
        var photoItems: String = ""
        
        if userCollection.count != 0 {
            photoItems = userCollection[indexPath.row]
        }
        
        cell.configure(photo: photoItems)
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer {
            collectionView.deselectItem(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "showCollectionFull", sender: nil)
    }
    
    
    func photoSize (_ array: [UserSizes],_ size: String) -> [String] {
        var sortedSizeArray = [String]()
        
        switch size {
            case "min":
                for i in 0...array.count-1 {
                    for j in 0...array[i].sizes.count-1 where array[i].sizes[j].width < 80 {
                        sortedSizeArray.append(array[i].sizes[j].photo)
                    }
                }
            case "max":
                for i in 0...array.count-1 {
                    for j in 0...array[i].sizes.count-1 where array[i].sizes[j].width > 1000 && array[i].sizes[j].width < 1300 {
                        sortedSizeArray.append(array[i].sizes[j].photo)
                    }
                }
        default:
            break
        }
        
        return sortedSizeArray
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
