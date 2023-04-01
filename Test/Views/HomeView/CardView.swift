//
//  CardView.swift
//  TestApp
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation
import SwiftUI

struct GridCardView:View{
   // @ObservedObject var getShopVm: GetShopsBySlugViewModel
  var ShopId:String
   var Shoplogo:String
    

   var shopName:String
     var description:String
     var price: Int
  
    var body: some View{
        
        VStack(alignment: .leading){
            
            
            AsyncImageView(imageurl: Shoplogo, width: 130, height: 110)

            
            
            
            
            customTextGrid(shopName: shopName, description: description, price: price)
            
        }
        
        .frame(width:155,height: 210)
        .background(Color.white)
        .border(Color(0xF4F4F4),width:1)
        .cornerRadius(8)
        .shadow(radius: 1, x: 0, y: 0)
    }
}

struct customTextGrid:View{
    var shopName :String
    var description :String
    var price :Int
    var body: some View{
        VStack(alignment: .leading,spacing:5){
          
                
                Text(shopName)
                .font(Font.custom("Outfit-Medium", size: 20))
                    
                    .foregroundColor(Color(0x0F1010))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
               
                 Text(description)
             
                    .font(Font.custom("Outfit-Medium", size: 15))
                  
                    .foregroundColor(Color(0x666666))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .fixedSize()
                 

            
            Text("$\(price)")
                .font(.system(size: 15,weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(Color(0x666666))
                .multilineTextAlignment(.leading)
                .lineLimit(3)
        }
        //.frame(width: 120)
    }
}
