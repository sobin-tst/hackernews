//
//  PostData.swift
//  H4ckerNexz
//
//  Created by Sobin Thomas on 06/12/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]// hits: api response key
}

struct Post: Decodable, Identifiable { //Identifiable is needed for List
    //id is needed for List
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let url: String? // can be null 
    let author: String
    let points: Int
}
