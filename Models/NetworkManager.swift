//
//  NetworkManager.swift
//  H4ckerNexz
//
//  Created by Sobin Thomas on 06/12/21.
//

import Foundation

class NetworkManger: ObservableObject {//can broadcast data
    
   @Published var posts = [Post]()// can be received by a listener
    
    func fetchData()  {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil{
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits// since posts is being observed and used in UI component
                            }
                           
                        }
                        catch{
                            print(error)
                        }
                    }
                    
                    
                }
                
            }
            task.resume()
        }
        
    }
    
}
