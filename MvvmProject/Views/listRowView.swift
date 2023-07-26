//
//  listRowView.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 28/06/23.
//

import SwiftUI

struct ListRowView:View{
    
    let item:itemModel
    
    var body: some View{
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green: .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}

struct listRowView_Previews: PreviewProvider {
    
    static var item = itemModel(title: "first Item", isCompleted: false)
    static var item2 = itemModel(title: "second item", isCompleted: true)
    static var previews: some View {
        
        Group(content: {
            ListRowView(item: item)
            ListRowView(item: item2)
        })
        .previewLayout(.sizeThatFits)
        
        
        
    }
}
