//
//  BuilderViews.swift
//  GameWynd
//
//  Created by RANA  on 24/10/24.
//

import SwiftUI


@ViewBuilder
func PlayInOverLay(game : GameModel) -> some View{
    ZStack(alignment : .bottom) {
        LinearGradient(colors: [.black.opacity(0.1), Color.clear, .black.opacity(0.1), .black.opacity(0.5), .black], startPoint: .top, endPoint: .bottom)
        HStack {
            Image(game.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(game.name)
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                
            
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "play.fill")
            })
        }
        .foregroundStyle(.white)
        .fontWeight(.bold)
        .padding(.horizontal, 15)
        .padding(.bottom , 10)
    }
}

@ViewBuilder
func myGridView(size : CGFloat) -> some View {
   
    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 20) {
        ForEach(gameList.shuffled()) { game in
            NavigationLink {
                GameDetailView(game: game)
                    .navigationBarBackButtonHidden()
            } label: {
                VStack {
                    Image(game.image)
                        .resizable()
                        .frame(width:( size / 2) - 25 , height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                      

                    Text(game.name)
                        .font(.headline)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .opacity(0.9)

                }
                .padding(10)
                .background(Color(.systemGray6).secondary)
                
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                .padding(.horizontal, 5)
                .overlay {
                    Image(systemName: "play")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .shadow(radius: 15)
                }
            }
        }
    }
}


#Preview{
    Home()
}
