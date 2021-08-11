//
//  addTripInfo.swift
//  finalProjectOutline
//
//  Created by Conant High on 3/6/20.
//  Copyright © 2020 Saanji Shah. All rights reserved.
//

import UIKit
import Firebase

class addTripInfo: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var datesTF: UITextField!
    var locationData = "nothing"
    var datesData = "nothing"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){        
        let tripVC = segue.destination as! viewTrips
        locationData = locationTF.text ?? String()
        datesData = datesTF.text ?? String()

        tripVC.location = locationData
        tripVC.dates = datesData
        addTripFB(locationName: locationData)
    }
    func addTripFB(locationName: String) {
        db.collection("users").document("username").setData([
            "location" : locationName
        ])
    db.collection("users").document("username").collection("trips").document(locationName).collection("expenses").document("first")
        .setData([
        "first": "first"
    ])
    db.collection("users").document("username").collection("trips").document(locationName).collection("packing").document("first").setData([
        "first": "first"
    ])
    db.collection("users").document("username").collection("trips").document(locationName).collection("schedule").document("first").setData([
        "first": "first"
    ])
        print("added new trip to FB")
        //add a new trip to firebase under username
        //there should be a global variable that is segued through frm the viewcontroller for the username
        //in FB add a new trip, if needed, and each trip should have a packing list, schedule, and expense sheet with no data
        //for the schedule, add a document for each day of the trip, need to figure out how data will be entered into the box
    }
}


