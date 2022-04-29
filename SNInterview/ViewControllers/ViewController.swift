//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

struct CoffeeShop {
    let name: String
    let review: String
    let rating: Int
}

//protocol CoffeeShopTapDelegate {
//    func didSelectItem(_ item: UIView?)
//}

///ViewController class subclass of UIViewController
/// - Description : ViewController Displays the list of coffee items files in PDF Viewer/

class ViewController: UIViewController {
//    var delegate: CoffeeShopTapDelegate!
    @IBOutlet private weak var stackView: UIStackView!

    @IBOutlet weak var itemTableView: UITableView!
    var viewModel = CoffeeItemViewModel()

//    private let reviews = [
//        CoffeeShop(name:"Lofty", review: "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon.", rating: 4),
//        CoffeeShop(name:"Zumbar", review: "Came to SD for school tour and heading back to the Bay Area after today's final meeting. Was drinking Starbucks the whole trip until my sis recommended this cafe to me. LOVE IT!", rating: 5),
//        CoffeeShop(name:"Blue Bottle", review: "The place was empty the afternoon I came in, so I was able to quickly place an order for their version of a New Orleans cold brew. I received my drink right as my credit card order went through.", rating: 3),
//        CoffeeShop(name:"Bird Rock", review: "When it comes to environment and ambience, this place is amazing! It has a cute lil look, yet looks a bit modern. It's very eye appealing and I would definitely deem Instagramable.", rating: 3),
//        CoffeeShop(name:"Better Buzz Coffee", review: "This coffee shop is really cute. The decor is beautiful, food and coffee is tasty and the service is friendly and quick.", rating: 5)
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /*
        reviews.forEach { coffeeShop in
            guard let containerView = CoffeeShopItemView.fromNib() as? CoffeeShopItemView else {
                fatalError("Failed loading CoffeeShopItemView")
            }
            
            containerView.nameLabel.text = coffeeShop.name
            containerView.reviewLabel.text = coffeeShop.review
            containerView.ratingLabel.text = "Rating: \(Int(coffeeShop.rating))"
            stackView.addArrangedSubview(containerView)
            containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        }
        
        delegate = CoffeeShopDetailsHandler()
        */
        
        //viewModel.MakeApiCall() Uncomment this line to make API call
        viewModel.fetchData()
    }
    
//    @objc
//    func onTap(item: UIView) {
//        delegate.didSelectItem(nil)
//    }
}

//class CoffeeShopDetailsHandler: CoffeeShopTapDelegate {
//    func didSelectItem(_ item: UIView?) {
//        let tapped = item as! CoffeeShopItemView
//        
//        // TODO: display the item's details
//        print("Item Tapped: \(tapped)")
//    }
//}

// MARK: - Tableview Delegate and Datasource methods

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNoOfRowsForSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoffeeItemTVC
        
        let itemObject = viewModel.getCoffeeItem(atIndex: indexPath.row)
        cell.itemNameLabel.text = "Name:\(itemObject.itemName ?? "NA")"
        cell.itemCommentLabel.text = "Review:\(itemObject.itemComments ?? "NA")"
        cell.itemRatingLabel.text = "Rating: \(itemObject.itemRating ?? 0)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetaiViewController
        let coffeeItemDetails = viewModel.getCoffeeItem(atIndex: indexPath.row)
        detailController.itemObject = coffeeItemDetails
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
}

