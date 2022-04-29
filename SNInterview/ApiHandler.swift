//
//  ApiHandler.swift
//  SNInterview
//
//  Created by MAilapuram on 28/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import Foundation
 
///ApiHandler class subclass of UIViewController
/// - Description : ApiHandler class handles the Network API call and also loads the json from local file.

final class ApiHandler {
    
    /// Function to get data from  server
    /// - parameter fromURLString: URL of network API
    /// - returns  completion: Swift callback returns data on success/failure and it's response

    func loadDataFromApi(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    /// Function to get data from  server
    /// - parameter forName: Name of the local json file
    /// - returns  Data : Swift callback returns data from local file path.

    func readJsonFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
