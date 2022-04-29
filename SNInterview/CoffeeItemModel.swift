//
//  CoffeeItemModel.swift
//  SNInterview
//
//  Created by MAilapuram on 28/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import Foundation

struct CoffeeItemModel: Decodable {
    var itemName: String?
    var itemComments:String?
    var itemRating: Int?
    
    enum CodingKeys: String, CodingKey {
        case itemName = "name"
        case itemComments = "review"
        case itemRating = "rating"
    }
}
