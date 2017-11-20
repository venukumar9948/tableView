//
//  ViewController.swift
//  swifttableview
//
//  Created by student on 11/20/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func addButton(_ sender: UIButton) {
    }
    @IBOutlet var textfield: UITextField!
    private var animals: NSMutableArray = ["Dog","Cow","cat","pig"]
    
    private var animalsImage : NSMutableArray = ["dog.jpeg","cow.jpg","cat.jpeg","pig.jpeg"]
    
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 10, y: 100, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.textfield.text = ""
        self.myTableView.reloadData()
        textField.resignFirstResponder()
        return true
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(animals[indexPath.row])"
        
       // cell.imageView!.image = "\(animalsImage[indexPath.row])"
        
        cell.vImage.image=[UIImage imageNamed:@"agon_logo.png"];

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    
    }
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        print("Deleted")
        
        self.animals.removeObject(at:indexPath.row)
        tableView.reloadData()
    }
}
}





