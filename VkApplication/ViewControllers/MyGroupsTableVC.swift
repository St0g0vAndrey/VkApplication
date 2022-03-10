//
//  MyGroupsTableVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit
import SwiftUI

final class MyGroupsTableVC: UITableViewController {
  
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")

        networkService.featchUser { [weak self] result in
            switch result {
            case .success(let myGroups):
                self?.myGroup = myGroups
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private let networkService = NetworkService()
    private var myGroup = [GroupModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addGroupsSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroups",
              let allGroupController = segue.source as? AllGroupTableVC,
              let groupIndex = allGroupController.tableView.indexPathForSelectedRow,
              !self.myGroup.contains(where: {$0.nameGroups == allGroupController.arrayGruop[groupIndex.row].nameGroups})
        else { return }
            self.myGroup.append(allGroupController.arrayGruop[groupIndex.row])
            tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }
        
        let corentGroup = myGroup[indexPath.row]
        cell.configure(emblem: UIImage(named: corentGroup.emblemGroup) ?? UIImage(), name: corentGroup.nameGroups)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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
