//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 林博斯 on 3/18/18.
//  Copyright © 2018 Bosi (Terrence) Lin. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    let realm = try! Realm()
    var categories : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    // MARK  - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for:indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
    // MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "goToItems", sender: self)
    }
    
        // will be triggered right before the segue is performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    // MARK - Data Manipulation Methods
    func save(category : Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
        
    }
    
    func loadCategories() {
        //retrieve all the data inside realm which are of data type object
        categories = realm.objects(Category.self)
    
        tableView.reloadData()
    }
    
    // MARK - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
        let newCategory = Category()
            newCategory.name = textfield.text!
            self.save(category: newCategory)
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create New Category"
            textfield = alertTextfield
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
