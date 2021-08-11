//
//  addPackingCategory.swift
//  finalProjectOutline
//
//  Created by Tejas Shah on 3/8/20.
//  Copyright © 2020 Saanji Shah. All rights reserved.
//

import UIKit
import Firebase
class addPackingCategory: UIViewController {
    var db = Firestore.firestore()
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var itemTF: UITextField!
    var categoryData = ""
    var itemData = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let packingVC = segue.destination as! packingList
        categoryData = categoryTF.text ?? String()
        itemData = itemTF.text ?? String()

        packingVC.category = categoryData
        packingVC.item = itemData
//        let addItemVC = segue.destination as! addItemPackingList
//        addItemVC.categoryData = categoryData
        addCategoryFB(categoryName: categoryData, itemName: itemData)
        
    }
    func addCategoryFB(categoryName: String, itemName: String) {
        var locationName = ""
       let locationNameSched = db.collection("users").document("username")

       locationNameSched.getDocument { (document, error) in
           if let document = document, document.exists {
            locationName = document.get("location") as! String
            print(locationName)
            self.db.collection("users").document("username").collection("trips").document(locationName).collection("packing").document("Clothes").setData([
                "item": itemName
            ])
           } else {
               print("Document does not exist")
           }
       }
    }
    //have a function that adds the new category and item to FB
}
