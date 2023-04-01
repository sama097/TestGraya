//
//  DestinationView.swift
//  Test
//
//  Created by TeamX Tec on 31/03/2023.
//

import Foundation



//
//  Store_Product_Detail_0.swift
//  raseef
//
//  Created by Teamx tec on 27/10/2022.
//

import SwiftUI
import CoreData




import SwiftUI


struct variationView: View{
    var Colorname:String
   
    var body: some View{
       
                ZStack {
  
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(.white))
                    
                                   .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                   
                                   .frame(width: 120,height: 50)
                        
                    HStack{
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 30,height: 30)
                        
                        Text("Colorname")
                            .font(Font.custom("Outfit-Medium", size: 12))
                            .foregroundColor(Color(0xBAAAAA))
                    }
                        
                                              
                        
//
//                        .border(Color(red: 0.8, green: 0.737, blue: 0.737), width: 2)
                       
                    // Add any additional content here
                }
              
               // .frame(maxWidth: .infinity, maxHeight: .infinity)
               // .background(Color.clear)
                
            
        

    }
}

struct topNavIcons: View{
    @Binding var pushtohomeView : Bool
    var id : String
    @State var showicon = false
    func CheckedFavProduct(ProductId : String
    ) ->Bool{
        var favProduct = UserDefaults.standard.stringArray(forKey: "FavProduct") ?? [];
     
        
            if favProduct.contains(ProductId) == true
            {
                
                    for i in 0..<favProduct.count{
                        
                        if favProduct[i] == ProductId{
                            favProduct.remove(at: i)
                            UserDefaults.standard.set(favProduct,forKey: "FavProduct")
                            print(UserDefaults.standard.stringArray(forKey: "FavProduct") ?? [])
                            return false
                        }
                    }
                
               
              
                return true
            }
            else{
               
                    favProduct.append(ProductId)
                   UserDefaults.standard.set(favProduct, forKey: "FavProduct")
                    print(UserDefaults.standard.stringArray(forKey: "FavProduct") ?? [])
                    return true
                
               
             
               
            }
            
      //  }
       
       
       
    }
    var body: some View{
        HStack{
            Button{
                withAnimation(Animation.linear(duration: 0.3)){
                    self.pushtohomeView.toggle()
                }
               
            }label:{
                Image(icon: .backIcon)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            
            Button{
//               var favprod = UserDefaults.standard.stringArray(forKey: "FavProduct")
//                favprod?.append(id)
                
                showicon =  self.CheckedFavProduct(ProductId : id)
                print(showicon)
            
            }
        label:{
            if  showicon{
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .aspectRatio(contentMode: .fit)
            }
            else{
                Image(icon: .heartIcon)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .aspectRatio(contentMode: .fit)
            }
            
        }
            
            
            
        }
            .offset(x:0,y:-100)
            .padding(.horizontal,30)
            
        
    }
}
struct DestinationView: View {
    let screenSize = UIScreen.main.bounds
     //@StateObject var viewmodel = DestinationViewModel()
    @State var no_of_product_card : Int = 1
    @State var showDescription = true
    @State var showReviews = false
  
   @State private var toast = false
    @State private var toastmsg = ""
    
    ///
    @State private var pushtoAddtoCart = false
   
    
    var productsinfo : [products]?
    
    @State var  productType = ""
    @State var  pushtohomeView = false
    @State var  pushtoProductVariable = false
    //
   
    var body: some View {
      
        if self.pushtohomeView{
            HomeView()
                .transition(.move(edge: .leading))
        }
        else{
            
            NavigationStack{
                
                
                
                ZStack{
                    
                    
                    GeometryReader { reader in
                        VStack(spacing:0){
                            AsyncImageView(imageurl:  productsinfo?.first?.image ?? "", width: screenSize.width, height: screenSize.height * 0.3)
                          
                                .ignoresSafeArea()
                                .overlay(
                                    topNavIcons(pushtohomeView: $pushtohomeView,id:  productsinfo?.first?.id ?? "")
                                )
                            
                            
                            ScrollView(.vertical,showsIndicators: false){
                                
                                
                                
                                LazyVStack(alignment:.leading,spacing:25){
                                    
                                    //VStack(alignment:.leading,spacing:5){
                                    
                                    HStack{
                                        Text(productsinfo?.first?.name ?? "name")
                                            .foregroundColor(Color(0x000000))
                                        
                                            .font(Font.custom("Outfit-Medium", size: 20))
                                        
                                        
                                        Spacer()
                                        
                                        Text("$\(productsinfo?.first?.price ?? 1200)")
                                            .font(Font.custom("Outfit-Medium", size: 24))
                                            .foregroundColor(Color(0x5534A5))
                                    }
                                    
                                    Text(productsinfo?.first?.detail ??  "(with solo app)")
                                        .foregroundColor(Color(0x695D5D))
                                        .font(Font.custom("Outfit-Medium", size: 16))
                                    
                                        .lineLimit(1)
                                    
                                    
                                    Text("colors")
                                    
                                        .font(Font.custom("Outfit-Medium", size: 20))
                                    
                                        .foregroundColor(Color(0x000000))
                                        .lineLimit(1)
                                    
                                    LazyHStack(spacing:15){
                                        ForEach(productsinfo?.first?.colors ?? [],id: \.id){
                                            i in
                                            variationView(Colorname: i.name ?? "")
                                        }
                                    }
                                    
                                    
                                    
                                    
                                    // }
                                    
                                    
                                    
                                    // VStack(alignment:.leading,spacing:10){
                                    
                                    
                                    
                                    HStack(spacing:20){
                                        Button{
                                            self.showDescription.toggle()
                                            self.showReviews = false
                                        }label:{
                                            Text("Description")
                                                .font(Font.custom("Outfit-Medium", size: 15))
                                                .foregroundColor(Color(0x827E7E))
                                        }
                                        Button{
                                            self.showReviews.toggle()
                                            self.showDescription = false
                                        }label:{
                                            Text("Reviews")
                                                .font(Font.custom("Outfit-Medium", size: 15))
                                                .foregroundColor(Color(0x827E7E))
                                        }
                                        
                                        
                                    }
                                    if showDescription{
                                        
                                        
                                        Text(productsinfo?.first?.description ?? "What is a case study? A case study is a research approach that is used to generate an in-depth, multi-faceted understanding of a complex issue in its real-life context. It is an established research design that is used extensively in a wide variety of disciplines")
                                        
                                        
                                            .font(Font.custom("Outfit-Medium", size: 15))
                                            .foregroundColor(Color(0xAAA0A0))
                                            .lineLimit(5)
                                        
                                        
                                        
                                        
                                    }
                                    if showReviews{
                                        
                                        Text(productsinfo?.first?.reviews ?? "Reviews ssssssssssssssssss")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(0x666666))
                                            .lineLimit(5)
                                        
                                    }
                                    
                                    
                                    
                                    
                                    /// }
                                    
                                    Button{
                                        
                                        
                                        self.toast = true
                                        self.toastmsg = "Successfully product added to the cart!"
                                        
                                        
                                        
                                    }label:{
                                        Text("Add to Cart")
                                        
                                            .font(Font.custom("Outfit-Medium", size: 24))
                                            .frame(width: screenSize.width * 0.86, height: screenSize.height * 0.08)
                                            .background(Color(0x004EDA))
                                        
                                        
                                        
                                            .foregroundColor(Color.white)
                                        
                                            .cornerRadius(20)
                                    }
                                    .padding(.top, 15)
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                .padding(.horizontal,30)
                                
                                
                                
                            }
                            
                            
                        }
                        .alert(self.toastmsg, isPresented: $toast){
                            Button("Ok"){
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                .background(Color.appbackgroundColor)
                
                
                
            }
            
            
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
    }
}

