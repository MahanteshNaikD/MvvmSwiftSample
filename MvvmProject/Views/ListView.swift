//
//  ListView.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 28/06/23.
//

import SwiftUI

struct ListView: View {
    
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    
   
    
    var body: some View {
        
        
        ZStack {
            if(listViewModel.items.isEmpty) {
               NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List(content: {
                    
                    ForEach(listViewModel.items , content: {item in
                        ListRowView(item:item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    })
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    // ListRowView(title: "this is first title")
                    
                })
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(), trailing:
                                NavigationLink("Add", destination: {
            AddView()
        })
        )
        
        
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView(content: {
            ListView()
        })
        .environmentObject(ListViewModel())
        
    }
}



