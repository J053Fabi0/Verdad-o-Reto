//
//  TableViewController.swift
//  Verdad o Reto
//
//  Created by J053_Fabi0 on 11/01/18.
//  Copyright © 2018 Yoyomero. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var lista: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addPersonPressed(_ sender: UIBarButtonItem) {
        showAddAlert()
    }
    
    @IBAction func shufflePressed(_ sender: UIBarButtonItem) {
        guard self.lista.count >= 2 else {
            showAlert(title: "Error", message: "Agrega más integrantes para poder jugar")
            return
        }
        
        let rnd1 = Int(arc4random_uniform(UInt32(self.lista.count)))
        var rnd2 = Int(arc4random_uniform(UInt32(self.lista.count)))
        
        while rnd1 == rnd2 {
            rnd2 = Int(arc4random_uniform(UInt32(self.lista.count)))
        }
        
        showShuffleAlert(rnd1: rnd1, rnd2: rnd2)
    }
    
    
    /**
     Show the alert that shows the new couple of persons playing
     */
    
    func showShuffleAlert(rnd1: Int, rnd2: Int) {
        let alert = UIAlertController(title: "\(self.lista[rnd1]) manda a \(self.lista[rnd2])", message: "¿Verdad o reto \(self.lista[rnd2])?", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(ok)
        
        let again = UIAlertAction(title: "Otra vez", style: UIAlertActionStyle.default) { (action) in
            let rnd1 = Int(arc4random_uniform(UInt32(self.lista.count)))
            var rnd2 = Int(arc4random_uniform(UInt32(self.lista.count)))
            
            while rnd1 == rnd2 {
                rnd2 = Int(arc4random_uniform(UInt32(self.lista.count)))
            }
            
            self.showShuffleAlert(rnd1: rnd1, rnd2: rnd2)
        }
        
        alert.addAction(again)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /**
     Show an alert with the title and message provided
     */
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /**
     Show the alert that ask for the new palyers name
     */
    
    func showAddAlert() {
        // Create alert controller
        let alert = UIAlertController(title: "Añadir participante", message: "Agrega el nombre del participante", preferredStyle: UIAlertControllerStyle.alert)
        
        // Create cancel action
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(cancel)
        
        // Create ok button
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action) in
            if let textFieldText = alert.textFields?[0].text {
                if textFieldText != "" {
                    self.lista.append(textFieldText)
                    self.tableView.reloadData()
                    
                    print("\nNew player added: \"\(textFieldText)\"")
                }
            }
        }
        
        alert.addAction(ok)
        
        // Add text field
        
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa el nombre"
            textField.autocapitalizationType = UITextAutocapitalizationType.words
        }
        
        // Present alertController 
        self.present(alert, animated: true, completion: nil)
    }
    
    // This allaw us to delete rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.lista.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.playerLabel.text = lista[indexPath.row]

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
