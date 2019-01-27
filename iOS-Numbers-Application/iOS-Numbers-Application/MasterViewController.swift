//
//  MasterViewController.swift
//  iOS-Numbers-Application
//
//  Created by Michał on 23/01/2019.
//  Copyright © 2019 Michał Gawryluk. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol NumberSelectionDelegate: class {
    func numberSelected(_ newNumber: Number)
}

class MasterViewController: UITableViewController {

    weak var delegate: NumberSelectionDelegate?
 
    
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    let numbersURL = "http://dev.tapptic.com/test/json.php"
    var numbers = [Number]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        Alamofire.request(numbersURL).responseJSON { response in
            if let json = response.result.value {
                
                let numbersArray : NSArray = json as! NSArray
                
                for i in 0..<numbersArray.count {
                    
                    self.numbers.append(Number(
                        name: ((numbersArray[i]) as AnyObject).value(forKey: "name") as? String,
                        image: ((numbersArray[i]) as AnyObject).value(forKey: "image") as? String,
                        text: ((numbersArray[i]) as AnyObject).value(forKey: "text") as? String
                        ))
            
            self.tableView.reloadData()
            
                }
            }
            
        self.tableView.reloadData()
            
        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MasterViewTableViewCell
        
        //        let number = numbers[indexPath.row] as! NSDate
        let number: Number
        number = numbers[indexPath.row]
        cell.numberLabel.text = number.name
        
        Alamofire.request(number.image!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.numberImage?.image = image
            }
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNumber = numbers[indexPath.row]
        delegate?.numberSelected(selectedNumber)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  

}

