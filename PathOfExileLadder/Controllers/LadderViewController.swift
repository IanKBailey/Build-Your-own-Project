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
    }



private func getLadder() {
    UserAPIClient.loadData() { (error, ladderData) in
        if let error = error {
            print(error.errorMessage())
        } else if let data = ladderData {
            self.ladderData = data
            
        }
    }
}


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = LadderTableView.indexPathForSelectedRow,
        let ladderDetailView = segue.destination as?
            LadderDetailViewController else {
                fatalError("Whoopsie")
        }
        let ladder = ladderData[indexPath.row]
         ladderDetailView.ladderInfo = ladder
    }
}

extension LadderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ladderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LadderTableView.dequeueReusableCell(withIdentifier: "LadderCell", for: indexPath)
            as! CustomCell
        let ladder = ladderData[indexPath.row]
        cell.rank?.text = "\(ladder.rank)"
        cell.characterName?.text = ladder.character.name
        return cell
    }
}
