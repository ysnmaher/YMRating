//
//  ContentView.swift
//  YMrating
//
//  Created by yassin maher mohamed on 13/06/2022.
//

import SwiftUI

public struct YMRating: View {
    @Binding var selected:Int
    var maxRating:Int
    var width:CGFloat
    var color : UIColor
    var fillSymbol :String
    var emptySymbol :String
    public init(maxRating:Int,selected:Binding<Int>,width:CGFloat=30,color:UIColor=UIColor.systemYellow,fillSymbol:String="heart.fill",emptySymbol:String="heart") {
        self.maxRating = maxRating
        self._selected = selected
        self.width = width
        self.color = color
        self.emptySymbol = emptySymbol
        self.fillSymbol = fillSymbol
        
    }
    
   public var body: some View {
        HStack {
            ForEach(0..<maxRating){ index in

                Image(systemName:index < selected ? fillSymbol : emptySymbol )
                        .resizable()
                        .foregroundColor(Color(self.color))
                        .frame(width:width,height:width)
                        .onTapGesture {
//                            print(index)
                            selected = index+1
                        }

            }


        }
        
    }
}

struct YMRating_Previews: PreviewProvider {
    static var previews: some View {
        YMRating(maxRating: 5, selected: .constant(3))
    }
}
