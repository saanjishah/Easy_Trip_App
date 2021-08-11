//
//  addItemPackingList.swift
//  finalProjectOutline
//
//  Created by Tejas Shah on 3/8/20.
//  Copyright © 2020 Saanji Shah. All rights reserved.
//

import UIKit
import Firebase
class addItemPackingList: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var itemTF: UITextField!
    var newItemData = ""
    var categoryData = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let packingVC = segue.destination as! packingList
        newItemData = itemTF.text ?? String()
        packingVC.newItem = newItemData
    }
    func addItemtoFB(newItem: String) {
        var locationName = ""
        let locationNameSched = db.collection("users").document("username")
//        let categoryNameRef = db.collection("users").document("username")
        
        locationNameSched.getDocument { (document, error) in
            if let document = document, document.exists {
                locationName = document.get("location") as! String
                print(locationName)
                self.db.collection("users").document("username").collection("trips").document(locationName).collection("packing").document(self.categoryData).setData([
                    "item": newItem
                ])
//                categoryNameRef.getDocument { (document, error) in
//                    if let document = document, document.exists {
//                        categoryName = document.get("category") as! String
//                        print(locationName)
//                        self.db.collection("users").document("username").collection("trips").document(locationName).collection("packing").document(categoryName).setData([
//                            "item": newItem
//                        ])
//                    } else {
//                        print("Document does not exist")
//                    }
//                }
            }
        }
    }
    //have a funciton that adds a new item to the category(may need to add another text field that tells FB which catgoery to add the new item too)
}
