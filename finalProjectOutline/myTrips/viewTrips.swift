//
//  viewTrips.swift
//  finalProjectOutline
//
//  Created by Conant High on 3/6/20.
//  Copyright © 2020 Saanji Shah. All rights reserved.
//

import UIKit

class viewTrips: UIViewController {
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var datesLbl: UILabel!
    var location = ""
    var dates = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLbl.text = location
        datesLbl.text = dates
    }
    
}
