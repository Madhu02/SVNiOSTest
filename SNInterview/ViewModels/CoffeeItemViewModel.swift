//
//  CoffeeItemViewModel.swift
//  SNInterview
//
//  Created by MAilapuram on 28/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import Foundation

///PdfViewController class subclass of UIViewController
/// - Description : PdfViewController Displays the PDF files in PDF Viewer/
class CoffeeItemViewModel {
    
    var apiHandler = ApiHandler()
    var dataSourceArray = [CoffeeItemModel]()
    
    func fetchData() {
        if let localData = apiHandler.readJsonFile(forName: "CoffeeShops") {
            self.parseJson(jsonData: localData)
        }
    }
    //Returns Coffee Items Count
    func getNoOfRowsForSection() -> Int {
        return dataSourceArray.count
    }
    //Returns Coffee Item
    func getCoffeeItem(atIndex: Int) -> CoffeeItemModel {
        let patient = dataSourceArray[atIndex]
        return patient
    }
    //
    private func parseJson(jsonData: Data) {
        if let object = try? JSONSerialization.jsonObject(with: jsonData) {
            if let jsonData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
            {
                do {
                    let decoder = JSONDecoder()
                    let decodedJsonArray = try decoder.decode([CoffeeItemModel].self,
                                                               from: jsonData)
                    dataSourceArray = decodedJsonArray
                } catch {
                    print("error: \(error)")
                }
            }
        }
        
    }
    
}
