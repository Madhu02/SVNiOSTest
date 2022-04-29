//
//  DetaiViewController.swift
//  SNInterview
//
//  Created by MAilapuram on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

///DetaiViewController class subclass of UIViewController
/// - Description : DetaiViewController Displays the review comments in details for every coffee item.

class DetaiViewController: UIViewController {

    @IBOutlet weak var commentsLabel: UILabel!
    var itemObject : CoffeeItemModel?
    var viewModel = CoffeeCommentsViewModel()
    var coffeeItemComments : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Review Comments"

        if let coffeeItem = itemObject {
            print(coffeeItem)
            let customViewModel = CoffeeCommentsViewModel(coffeeItemObject: coffeeItem)
            viewModel = customViewModel
            commentsLabel.text = viewModel.coffeeItemObject.itemComments
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
