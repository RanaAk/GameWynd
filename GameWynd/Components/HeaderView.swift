//
//  HeaderView.swift
//  GameWynd
//
//  Created by RANA  on 24/10/24.
//

import SwiftUI

struct HeaderView: View {
    @State private var changeDisplayColor : Bool = false
   
    var body: some View {
        HStack{
            Image(.user)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 18))
            
            VStack(alignment : .leading){
                Text("Hello!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("Rana Ak")
            }
            .padding(.leading)
            Spacer()
            Button(action: {
                changeDisplayColor.toggle()
                
                
            }, label: {
                Image(systemName: changeDisplayColor == false ?  "sun.max" : "moon.stars")
                    .resizable()
                    //.imageScale(.small)
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(.gray.gradient.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 18))
                    
                   
                   // .tint(.black)

            }).contentTransition(.symbolEffect(.replace))
                .preferredColorScheme(changeDisplayColor == true ? .light : .dark)

            
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderView()
}
