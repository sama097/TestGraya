//
//  ContentView.swift
//  Test
//
//  Created by TeamX Tec on 31/03/2023.
//

import SwiftUI

//
//  ContentView.swift
//  Shared
//
//  Created by Jared Davidson on 10/14/21.
//

import SwiftUI

import SDWebImageSwiftUI

struct AsyncImageView: View {
    var imageurl :String
     var width:CGFloat
    var height:CGFloat
    
    var body: some View {
        let u = imageurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        WebImage(url: URL(string: u ?? "https://hws.dev/img/bad.png"))
        .placeholder {
          
            Image(icon: .shopicon)
                .resizable()
                .frame(width: width, height: height)
                .border(Color(0xB8A6A6).opacity(1), width: 1)
                .cornerRadius(14)
              
        }
        .resizable()
        .frame(width: width, height: height)
        .border(Color(0xB8A6A6).opacity(1), width: 1)
        .cornerRadius(14)
    }
}





struct HomeView: View {
    @State private var Searchtext = ""
    let columns: [GridItem] = [
         GridItem(.flexible(), spacing: 10),
         GridItem(.flexible())
     ]
    @StateObject var vm = ViewModel()
    @State private var  menuopen = false
    //var gridItemLayout = [GridItem(.flexible()),spacing: 16,GridItem(.flexible())]
 @State private var pushtoDestinationView = false
    
    var body: some View {
        if pushtoDestinationView{
            
            DestinationView(productsinfo: vm.productDetail)
                .transition(.move(edge: .trailing))
        }
        else{
            NavigationStack{
                
                
                ZStack{
                    Color.appbackgroundColor
                        .ignoresSafeArea()
                    GeometryReader{
                        
                        geo in
                        VStack(alignment:.leading,spacing: 10){
                            TopBar(vm: vm, searchText: $Searchtext, menuopen: $menuopen)
                            MainHeading()
                            
                            TabBarView( vm: vm)
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns: columns, spacing: 10) {
                                    if Searchtext.isEmpty{
                                        ForEach(vm.filterp, id: \.id) {
                                            card in
                                            Button{
                                                self.vm.productByid(id:card.id)
                                                withAnimation(Animation.linear(duration: 0.3)){
                                                    self.pushtoDestinationView.toggle()
                                                }
                                            }label:{
                                                GridCardView(ShopId: card.id, Shoplogo: card.image ?? "", shopName: card.name ?? "", description: card.description ?? "", price: card.price ?? 0)
                                            }
                                        }
                                    }
                                    else{
                                        ForEach(vm.filterp2, id: \.id) {
                                            card in
                                            Button{
                                                self.vm.productByid(id:card.id)
//                                                withAnimation(Animation.linear(duration: 0.3)){
//                                                    self.pushtoDestinationView.toggle()
//                                                }
                                            }label:{
                                                GridCardView(ShopId: card.id, Shoplogo: card.image ?? "", shopName: card.name ?? "", description: card.description ?? "", price: card.price ?? 0)
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        .padding(.horizontal,30)
                        .padding(.vertical,20)
                    }
                    SideMenuView(isOpen: $menuopen, text: $Searchtext)
                        .edgesIgnoringSafeArea(.all)
                    
                }
                
                .onAppear{
                    vm.getData()
                }
                
            }
        }
    }
}

struct HomeView_Previews2: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
