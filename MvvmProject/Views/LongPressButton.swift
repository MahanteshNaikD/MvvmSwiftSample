//
//  LongPressButton.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 11/07/23.
//

import SwiftUI



struct LongPressButton: View {
    
    
    @State var isCompleted : Bool = false
    
    
    @State var isSuccessfull :  Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccessfull ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
            
            
            HStack{
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration:1.0,maximumDistance: 50) { (isPressing) in
                        //START OF THE PROCESS
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)){
                                isCompleted = true
                            }
                          
                        }else {
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                                if(!isSuccessfull){
                                    withAnimation(.easeInOut){
                                        isCompleted = false
                                        
                                    }
                                }
                            })
                        }
                    } perform:{
                        //AT THE MININUM DURATION
                        withAnimation(.easeInOut){
                            isSuccessfull = true
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isSuccessfull = false
                        isCompleted = false
                    }
            }
            
           
        }
        
        
        
        
        
//        Text(isCompleted ? "COMPLETED" : "NOT COMPLETED")
//            .padding()
//            .padding(.horizontal)
//            .background(isCompleted ?  Color.green : Color.gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isCompleted.toggle()
////            }
//            .onLongPressGesture (minimumDuration: 5.0, maximumDistance: 1){
//                isCompleted.toggle()
//            }
    }
}

struct LongPressButton_Previews: PreviewProvider {
    static var previews: some View {
        LongPressButton()
    }
}
