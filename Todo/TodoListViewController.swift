//
//  ViewController.swift
//  Todo
//
//  Created by ElliotMo on 30/7/18.
//  Copyright © 2018 Elliot He. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["list1","list2","list3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK - Add Button
    @IBAction func handleAddButtonPressed(_ sender: UIBarButtonItem) {
        var text = UITextField()
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type your new ToDo item"
            text = alertTextField
        }
        let action1 = UIAlertAction(title: "Add", style: .default) { (action) in
            if (text.text != "") {
                self.itemArray.append(text.text!)
            }
            self.tableView.reloadData()
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    

}

