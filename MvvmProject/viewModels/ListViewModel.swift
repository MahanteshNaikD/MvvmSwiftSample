//
//  ListViewModel.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 29/06/23.
//

import Foundation


class ListViewModel:ObservableObject {
    
    @Published var items:[itemModel] = []{
        didSet {
            saveItem()
        }
    }
    
    
    init() {
        getItem()
    }
    
    
    func getItem (){
        
        
        
        guard
            let v1 = UserDefaults.standard.data(forKey: "items_list")   else {return}
        
        guard let v2 = try? JSONDecoder().decode([itemModel].self, from: v1) else {return}
        
        self.items = v2
        
    }
    
    
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func deleteItem(indexSet:IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    
    func addItem(title:String){
        let newItem = itemModel(title: title, isCompleted: false)
        
        items.append(newItem)
    }
    
    
    func updateItem (item:itemModel){
        
        if let index = items.firstIndex(where: { exteting in
            return exteting.id == item.id
        }) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    
    
    func saveItem(){
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "items_list")
        }
        
    }
    
}
