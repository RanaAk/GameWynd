//
//  GameDetailView.swift
//  GameWynd
//
//  Created by RANA  on 22/10/24.
//

import SwiftUI

struct GameDetailView: View {
    var game : GameModel
    @Environment(\.dismiss) private var dismiss
    @State private var playGame : Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Image(game.image)
                    .resizable()
                    .frame(width: 400, height: 350)
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "arrowshape.backward.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.white)
                            })
                           
                            
                            
                        }
                    })
                   
                    
                
                Text(game.name)
                    .font(.title2)
                    .foregroundStyle(.white.gradient)
                    .padding()
                    .background(Color(.systemGray2))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                VStack(alignment : .leading , spacing: 10){
                    
                    Text("Descriptions")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.blue))
                        .padding([.top, .leading])
                    
                    Text(game.caption)
                        .padding(.leading)
                    
                }
                  
                Button(action: {
                    playGame.toggle()
                }, label: {
                    Image(systemName: "play")
                        .imageScale(.large)
                        .bold()
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 300)
                })
                .background(RoundedRectangle(cornerRadius: 20).fill(.cyan.gradient))
                .padding(.top)
                .fullScreenCover(isPresented: $playGame, onDismiss: {
                    // Code to run on dismiss
                }, content: {
                    ZStack {
                        WebView(url: URL(string: game.link))
                            .ignoresSafeArea()
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    playGame = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.black.gradient)
                                        .font(.title)
                                        .padding()
                                }
                            }
                            Spacer()
                        }
                    }
                })

                
                Spacer()
            }

            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    GameDetailView(game: gameList[0])
}
