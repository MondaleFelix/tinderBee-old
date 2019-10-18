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
    
    var stops: [Stop] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(StopTableViewCell.self, forCellReuseIdentifier: "stopID")
    AF.request("https://api.metro.net/agencies/lametro/routes/2/stops/11989/predictions/").response { response in
        guard let data = response.data else { return }
        let rootContainer = try? JSONDecoder().decode(RootContainer.self, from: data)
        self.stops = rootContainer?.items ?? []
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopID", for: indexPath)
        let stop = stops[indexPath.row]
        cell.textLabel?.text = "Bus coming in \(stop.arrivalMinutes) and currently leaving = \(stop.isDeparting)"
        return cell
    }


}

