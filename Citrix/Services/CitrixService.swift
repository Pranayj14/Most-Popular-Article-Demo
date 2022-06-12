//
//  CitrixService.swift
//  Citrix
//
//  Created by Pranay Joshi on 11/06/22.
//

import Foundation

class CitrixService {
    // MARK: - Declaration of variables.
    var json = NSDictionary()
    typealias response = NSDictionary
    typealias jsonHandler = (response?, Error?) -> Void
    
    // MARK: - mostPopularApi api call.
    func mostPopular(completionHandler: @escaping jsonHandler){
        let getURL : String = mostPopularApi + apiKey
        
        let url = URL(string : getURL)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if error == nil {
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
                    completionHandler(json, nil)
                    
                }catch _ as NSError {
                    completionHandler(nil, error!)
                }
                
            }else{
                completionHandler(nil, error!)
            }
            
        }.resume()
    }
}
