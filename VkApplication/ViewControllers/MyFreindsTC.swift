//
//  MyFreindsTC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit
import Kingfisher

final class MyFreindsTC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        netWorkUser.featchUser { [weak self] result in
            switch result {
            case .success(let myFreinds):
                self?.myFreinds = myFreinds
            case .failure(let error):
                print(error)
            }
        }
    }

    private let netWorkUser = NetworkServiceUser()
    var myFreinds = [UserModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showPhoto",
              let destination = segue.destination as? PhotoCollectionVC,
              let FreindVC = segue.source as? MyFreindsTC,
              let indexUser = FreindVC.tableView.indexPathForSelectedRow
        else { return }
        destination.userId = sortedByName(myFreinds)[indexUser.section].userId
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myFreinds.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alpha()[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell
        else { return UITableViewCell() }

        let freinds = sortedByName(myFreinds)[indexPath.section]
        
        cell.configure(emblem: freinds.userPhoto, name: "\(freinds.userFamily) \(freinds.userName)")
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {

        return stride(from: 0, to: alpha().count, by: 1).map { alpha()[$0] }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return alpha()[section]
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        index
    }
    
    //MARK: - Custom Func
    private func sortedByName(_ arrayFreind: [UserModel]) -> [UserModel] {
        arrayFreind.sorted(by: {$0.userFamily < $1.userFamily})
    }
    
    private func alpha() -> [String] {

        var a = [String]()
        if sortedByName(myFreinds).count != 0 {
            for i in 0...sortedByName(myFreinds).count-1 {
                let m = sortedByName(myFreinds)[i].userFamily
                let oneNameIndex = String(m[m.index(m.startIndex, offsetBy: 0)])
                a.append(oneNameIndex)
            }
        }
        return a
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

