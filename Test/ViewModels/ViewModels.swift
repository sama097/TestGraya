//
//  ViewModels.swift
//  Test
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation

//
//  ViewModel.swift
//  firestore-demo-spm
//
//  Created by Chris Ching on 2021-09-16.
//
//import FirebaseFirestoreSwift

import Foundation
import Firebase
import FirebaseCore

class ViewModel: ObservableObject {
    
    @Published var list = [Products]()
    @Published var filterp = [products]()
    @Published var filterp2 = [products]()
  
    @Published var productDetail = [products]()
    func filterByid(id:String){
        filterp = []
        for i in 0..<list.count{
           
            for p in 0..<(list[i].categories?.count ?? 0){
                
                if list[i].categories?[p].id == id{
                    filterp.append(contentsOf: list[i].categories?[p].products ?? [])
                    break
                }
            }
        }
        print(filterp)
    }

    func filterByName(name:String){
        if name.isEmpty{
           // self.isApiLoader = false
          
            
        }
        else{
           filterp2 = filterp.filter { $0.name?.lowercased().hasPrefix(name.lowercased()) == true}

            print(filterp2)
           

        }
    }
    
    func productByid(id:String){
        productDetail = filterp.filter { $0.id == id}

         print(productDetail)
        
    }
    func getData() {

        let db = Firestore.firestore()
        
       // let docRef = db.collection("Products").document("lbCS2KcPd1zZ481bibLO")
        
        db.collection("Products").addSnapshotListener { (querysnap, error) in
            guard let doc = querysnap?.documents else{
                print("no")
                return
            }
            self.list = doc.map{ (QueryDocumentSnapshot) -> Products in
                let data = QueryDocumentSnapshot.data()
       //         print(data)
               
                _ = data["categories"] as? [NSDictionary] ?? []
              ////  print(c)
                let categData = data["categories"] as? [NSDictionary]
               // print(categData?.first)
                var categ = [categories]()
                if let categData = categData {
                    for categDict in categData {
                        let categName = categDict["name"] as? String ?? ""
                       // print(categName)
                        let categId = categDict["id"] as? String ?? ""
                      //  print(categId)
                        let categProducts = categDict["products"] as? [NSDictionary]
                       // print(categProducts?.first as Any)
                        var categproduct = [products]()
                        if let categProducts = categProducts {
                            for productDict in categProducts {
                               // print(productDict["name"] as Any)
                                let name = productDict["name"] as? String ?? ""
                                let price =  productDict["price"] as? Int ?? 0
                                let detail  = productDict["detail"] as? String ?? ""
                                let reviews  = productDict["reviews"] as? String ?? ""
                                let description  = productDict["description"] as? String ?? ""
                                let image  = productDict["image"] as? String ?? ""
                                let colorDict = productDict["colors"] as? [NSDictionary]
                                var color = [colors]()
                                if let colorDict = colorDict {
                                    for c in colorDict {
                                        let name = c["name"] as? String ?? ""
                                        let id = c["id"] as? String ?? ""
                                        let colorObj = colors(id: id,name: name)
                                        color.append(colorObj)
                                    }
                                    
                                }
                                
                                let prodObj = products(name: name,price: price,detail: detail,reviews:reviews, description: description,colors: color)
                                categproduct.append(prodObj)
                            }
                            
                        }
                        let categObject = categories(id:categId, name: categName,products: categproduct)
                        categ.append(categObject)
                    }
                }
               // print(name)
                //print(id)
                return Products(categories: categ)
            }
            
            if self.list.isEmpty == false{
                print(self.list)
               
            }

        }

        db.collection("Products").getDocuments() { (querySnapshot, error) in
                              if let error = error {
                                      print("Error getting documents: \(error)")
                              } else {
                                      for document in querySnapshot!.documents {
                                          let data = document.data()
                                         // print(data)
                                         
                                          let name = data["name"] as? String ?? ""
                                          let categ = data["categories"] as? [categories]
              
                                          
                                      }
                                 
                              }
              }
        
    }
    
}

struct c: Identifiable{
    
    var id : String?
    var name: String?
}
