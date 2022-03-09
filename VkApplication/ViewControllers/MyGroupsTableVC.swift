//
//  MyGroupsTableVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit

final class MyGroupsTableVC: UITableViewController {
  
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
    }
    
    var group = [GroupModel]()
    
    @IBAction func addGroupsSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroups",
              let allGroupController = segue.source as? AllGroupTableVC,
              let groupIndex = allGroupController.tableView.indexPathForSelectedRow,
              !self.group.contains(where: {$0.nameGroups == allGroupController.arrayGruop[groupIndex.row].nameGroups})
        else { return }
            self.group.append(allGroupController.arrayGruop[groupIndex.row])
            tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }
        
        let corentGroup = group[indexPath.row]
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
            group.remove(at: indexPath.row)
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
