//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self // Set the table view's data source to self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // Register a cell reuse identifier for the table view cells
        }
        
        @IBAction func saveNewToDo(_ sender: Any) {
            if let todo_text = todoText.text {
                if  (!todo_text.isEmpty && todo_text.count > 0) {
                    let newToDo = ToDo(t: todo_text, isUrgent: isUrgentSwitch.isOn)
                    todoText.text = ""
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        appDelegate.todos.append(newToDo)
                        tableView.reloadData() // Reload the table view to display the new to-do item
                    }
                }
            }
        }
                
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                return appDelegate.todos.count
            }
            return 0
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    let todo = appDelegate.todos[indexPath.row]
                    cell.textLabel?.text = todo.title
                    cell.textLabel?.textColor = todo.isUrgent ? UIColor.red : UIColor.green // Set the text color based on the task's urgency
        }
        return cell
        
    }    
}
   
