//
//  Home.swift
//  GameWynd
//
//  Created by RANA  on 22/10/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            HeaderView()
            
            VStack {
                GeometryReader{ proxy in
                    let size = proxy.size
                    
                    ScrollView{
                        ScrollView(.horizontal) {
                            
                            LazyHStack {
                                ForEach(gameList){ game in
                                    NavigationLink {
                                        GameDetailView(game: game)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        Image(game.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: size.width-40, height: size.width-20, alignment: .leading)
                                        
                                            .overlay(alignment: .bottom, content: {
                                                PlayInOverLay(game: game)
                                            })
                                            .clipShape(.rect(cornerRadius: 18))
                                            .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 10)
                                            .padding(.leading, 20)
                                    }
                                   
                                    
                                }
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.7)
                                    //view.offset(x : phase.value * -250)
                                }
                                
                                
                            }
                            
                            .padding([.top, .bottom], 15)
                            //.padding(.leading , 0)
                            .scrollTargetLayout()
                            
                        }
                        
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        
                        Text("All Games")
                            .font(.title2)
                            .fontWeight(.semibold)
                        myGridView(size: size.width)
                        
                        //.padding(.horizontal, 20) // Padding for the grid container
                        
                        
                    }
                }
            }
        }
        .fontDesign(.monospaced)
    }
    
}

#Preview {
    Home()
}
