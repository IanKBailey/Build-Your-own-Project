//
//  ViewController.swift
//  PathOfExileLadder
//
//  Created by Ian Bailey on 12/21/18.
//  Copyright © 2018 Ian Bailey. All rights reserved.
//

import UIKit

class LadderViewController: UIViewController {

    @IBOutlet weak var LadderTableView: UITableView!
    
    var ladderData = [POELadder]() {
        didSet {
            DispatchQueue.main.async {
                self.LadderTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getLadder()
        LadderTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }



private func getLadder() {
    UserAPIClient.loadData() { (error, ladderData) in
        if let error = error {
            print(error.errorMessage())
        } else if let data = ladderData {
            self.ladderData = data
            dump(ladderData)
            dump(data)
            }
        }
            
        }


    
    
    
    
    
    

}
extension LadderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ladderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LadderTableView.dequeueReusableCell(withIdentifier: "LadderCell", for: indexPath)
        let ladder = ladderData[indexPath.row]
        cell.textLabel?.text = ladder.character.name
        return cell
    }
}
