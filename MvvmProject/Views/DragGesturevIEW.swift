//
//  DragGesturevIEW.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 13/07/23.
//

import SwiftUI

struct DragGesturevIEW: View {
    
    
    @State var offfset : CGSize = .zero
    
    var body: some View {
        
        
        
        
//        RoundedRectangle(cornerRadius: 20.0)
//            .frame(width: 100,height: 100)
//            .gesture(
//                DragGesture()
//                    .onChanged({ value in
//                        withAnimation(.spring()){
//                            offfset = value.translation
//                        }
//                    })
//                    .onEnded({value  in
//                        withAnimation(.spring()){
//                            offfset = .zero
//                        }
//                    })
//            )
          
        ZStack {
            VStack {
                Text("\(offfset.width)")
                Spacer()
            }
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(40)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .offset(offfset)
                //.scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()){
                                offfset = value.translation
                            }
                        })
                        .onEnded({value  in
                            withAnimation(.spring()){
                                offfset = .zero
                            }
                        })
                )
        }
        
      
    }
    
    
    func getScaleAmount() -> CFloat {
        let max = UIScreen.main.bounds.width / 2
        let current = abs(offfset.width)
        let percentage = current/max
        return CFloat(1.0 - min(percentage, 0.5))
    }
}

struct DragGesturevIEW_Previews: PreviewProvider {
    static var previews: some View {
        DragGesturevIEW()
    }
}
