//
//  AddView.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 28/06/23.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var textfildText:String = ""
    
    
    @State var alertType:String = ""
    
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here...",
                          text: $textfildText){}
                    .padding(.horizontal)
                
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button("SAVE", action: saveButtonPressed)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundColor(.white)
                    .background(content: {
                        Color(.blue)
                    })
                    .cornerRadius(10)
                
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item  🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveButtonPressed(){
        
        if(textCheck()){
            listViewModel.addItem(title: textfildText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    
    func textCheck() ->Bool {
        if(textfildText.count < 3){
            alertType = "please enter full char"
            showAlert.toggle()
            return false
        }
        
        
        return true
    }
    
    
    func getAlert() ->Alert {
        return Alert(title: Text(alertType))
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            AddView()
        })
        .environmentObject(ListViewModel())
       
        
    }
}
