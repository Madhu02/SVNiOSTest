//
//  CoffeeCommentsViewModel.swift
//  SNInterview
//
//  Created by MAilapuram on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import Foundation

///PdfViewController class subclass of UIViewController
/// - Description : PdfViewController Displays the PDF files in PDF Viewer/

class CoffeeCommentsViewModel:NSObject {
    
    var coffeeItemObject = CoffeeItemModel()

    override init() {
        
    }
    //Custom Init
    init(coffeeItemObject: CoffeeItemModel) {
        self.coffeeItemObject = coffeeItemObject
    }
    
}
