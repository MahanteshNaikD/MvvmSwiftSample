//
//  MangificinetGeustre.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 12/07/23.
//

import SwiftUI

struct MangificinetGeustre: View {
    
    
    @State var currentAmount : CFloat = 0
    
    var body: some View {
        
        
        VStack {
            HStack{
                Circle()
                    .frame(width: 35,height: 35)
                Text("Mahantesh")
                   
                Spacer()
                Image(systemName: "ellipsis")
                
            }.padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + CGFloat(currentAmount))
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount = CFloat(value - 1)
                        })
                        .onEnded({value in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                        })
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is My Caption for my photo!")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(30))
//            .scaleEffect(1 + CGFloat(currentAmount))
//            .gesture(
//                MagnificationGesture()
//                    .onChanged{ value in
//                        currentAmount = CFloat(value-1)
//                    }
//            )
    }
}

struct MangificinetGeustre_Previews: PreviewProvider {
    static var previews: some View {
        MangificinetGeustre()
    }
}

