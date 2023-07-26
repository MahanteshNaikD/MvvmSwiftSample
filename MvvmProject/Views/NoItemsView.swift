//
//  NoItemsView.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 30/06/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate:Bool = false
    
    let secondaryColorAsset = Color("SceondaryAssetColor")
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 10){
                Text("There are No Itesm")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("You Are a Productive Person? I think you add click on  add button to add items i your todo list!")
                    .padding(.bottom,20)
                
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🖊")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryColorAsset :Color.accentColor)
                        .cornerRadius(10)
                }
                ).padding(.horizontal, animate ? 50 : 30)
                 .shadow(
                    color: animate ? secondaryColorAsset.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y:animate ? -7 : 0)
              
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
       
    }
    
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
            withAnimation(Animation
                .easeInOut(duration: 2)
                .repeatForever()) {
                animate.toggle()
            }
        })
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group(content: {
            NavigationView(content: {
                NoItemsView()
                    .navigationTitle("Title")
            })
            
            NavigationView(content: {
                NoItemsView()
                    .navigationTitle("Title")
            })
        })
        
      
      
    }
}
