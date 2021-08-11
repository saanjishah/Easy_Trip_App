//
//  packingList.swift
//  finalProjectOutline
//
//  Created by Tejas Shah on 3/8/20.
//  Copyright © 2020 Saanji Shah. All rights reserved.
//

import UIKit

class packingList: UIViewController {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var itemLbl: UILabel!
    var category = ""
    var item = ""
    var newItem = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLbl.text = category
        //Adding a new item does not work, because data is not saved, so will have to complete the task by using FB
        itemLbl.text = item + "" + newItem
        //need to add new item onto a new list
    }
    //need to use FB to get most recent lbl's for the packing list
}
