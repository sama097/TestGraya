//
//  topView.swift
//  TestApp
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @State var currentTab: Int = 0
    @Namespace var namespace
    @ObservedObject var vm : ViewModel
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(vm.list,id: \.id){
                    cat in
                    
                    ForEach(Array(zip((cat.categories?.indices)!,
                                      cat.categories ?? [])),
                            id: \.0,
                            content: {
                        index, name in
             //           Text("DAS")
                        TabBarItem(vm: vm, id: name.id ?? "", currentTab: self.$currentTab,
                                   namespace: namespace.self,
                                   tabBarItemName: name.name ?? "",
                                   tab: index)
                        
                    })
                }
                
            }
            .frame(height: 80)
            
            
        }
    }
}
struct TabBarItem: View {
    @ObservedObject var vm : ViewModel
    var id : String
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            vm.filterByid(id: id)
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                    .foregroundColor(currentTab == tab ? .CatgeoriesSelected:.CategoriesUnselected)
                if currentTab == tab {
                    Color.CatgeoriesSelected
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                    
                        .onAppear{
                            vm.filterByid(id: id)
                        }
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}



struct searchlabelView:View{
    @Binding var searchText:String
    @ObservedObject var vm : ViewModel
   
    var body: some View{
        HStack
        {
            Image(icon: .searchIcon)
                
                .resizable()
                .frame(width: 24, height: 24)
                .aspectRatio(contentMode: .fit)
            TextField("",text: $searchText)
               
                .foregroundColor(.black)
                .placeholder(when: searchText.isEmpty) {
                     Text("search product..")
                        .foregroundColor(.placeholder)
             }
                
        }
        .padding(.horizontal,10)
        .frame(width: 220,height: 51)
       .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .searchbarBorder, radius: 2, x: 0, y: 0)
        
        .onSubmit {
            vm.filterByName(name: searchText)
        }
       .submitLabel(.search)
       
    }
}
struct TopBar: View{
    @ObservedObject var vm : ViewModel
    @Binding var searchText:String
   
    @Binding var menuopen : Bool
   
    var body: some View{
        HStack(spacing:0){
            Button{
                self.menuopen.toggle()
            }label: {
                Image(icon: .menuIcon)
                    .resizable()
                    .frame(width: 30,height: 30)
            }
       
              
            Spacer()
            searchlabelView(searchText: $searchText, vm: vm)
              
        }
       
    }
}


struct MainHeading: View{
    
    var body: some View{
        VStack(alignment:.leading){
            Text("find your suitable")
            Text("watch now.")
        }
        .fixedSize()
        .font(.system(size: 36,weight: .bold))
    }
}
