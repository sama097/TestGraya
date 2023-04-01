//
//  Models.swift
//  Test
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation
import Firebase

//struct Products: Identifiable {
//
//    var id: String?
//    var name: String?
//    var color:[color]?
//
//}
//struct color : Codable{
//
//
//    var name: String?
//}
struct Products: Identifiable{
    var id = UUID()
    
    var categories: [categories]?
}
struct categories: Codable{
    
    var id : String?
    var name: String?
    var products: [products]?
}
struct products: Identifiable,Codable{
   
    var id = UUID().uuidString
    
    var name: String?
    var price: Int?
    var detail: String?
    var reviews:String?
    var description: String?
    var image:String?
    var colors:[colors]?
    
}
struct colors: Codable{
    var id :String?
    var name: String?
}
