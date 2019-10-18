//
//  ViewController.swift
//  Metro
//
//  Created by Mondale on 10/17/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    
    var stops: [Stop] = []
    
    var busNumber: Int = 2
    
    lazy var updateButton: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.title = "Edit"
        item.target = self
        item.action = #selector(presentAlert)
        return item
    }()
    
    lazy var busNumberButton: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.title = "\(self.busNumber)"
        item.target = self
        item.action = #selector(presentAlert)
        return item
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Incoming Buses"
        navigationItem.rightBarButtonItem = updateButton
        navigationItem.leftBarButtonItem = busNumberButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(StopTableViewCell.self, forCellReuseIdentifier: "stopID")
    }
    
    @objc func presentAlert() {
        let alert = UIAlertController(title: "Choose a stop", message: "Input your bus stop id", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Stop ID e.g. 11989"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            guard let stopId = alert.textFields?[0].text else { return }
            self.makeNetworkRequest(stopId: stopId)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func makeNetworkRequest(stopId: String) {    AF.request("https://api.metro.net/agencies/lametro/routes/\(self.busNumber)/stops/\(stopId)/predictions/").response { response in
        guard let data = response.data else { return }
        let rootContainer = try? JSONDecoder().decode(RootContainer.self, from: data)
        self.stops = rootContainer?.items ?? []
        self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopID", for: indexPath)
        let stop = stops[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = "Next bus arriving in  \(stop.arrivalMinutes) mins"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stops.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }


}

