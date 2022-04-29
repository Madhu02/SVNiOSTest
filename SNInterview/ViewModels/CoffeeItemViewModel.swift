//
//  CoffeeItemViewModel.swift
//  SNInterview
//
//  Created by MAilapuram on 28/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import Foundation

///CoffeeItemViewModel class subclass of NSObject
/// - Description : CoffeeItemViewModel fetches the json data from local file, parse the response the stores the data in Model object. Returns no of rows and Returns Items at index. Makes API call to fetch data from server using URLSession.;
class CoffeeItemViewModel {
    
    var apiHandler = ApiHandler()
    var dataSourceArray = [CoffeeItemModel]()
    
    func fetchData() {
        if let localData = apiHandler.readJsonFile(forName: "CoffeeShops") {
            self.parseJson(jsonData: localData)
        }
    }
    
    func MakeApiCall(){
        apiHandler.loadDataFromApi(fromURLString: "") { result in
            switch result {
            case .success(let data):
                self.parseJson(jsonData: data)
            case .failure(let error):
                print(error)
            }
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
    // Private function to parse the Json data.
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
