//
//  Loader.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 15/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import SwiftUI

struct Loader: View {
    @State var animate = false
    @State var visible = true
    
        var body: some View {
            GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .frame(width: 150, height: 200, alignment: .center)
                RoundedRectangle(cornerRadius: 29, style: .continuous)
                    .scaledToFit()
                    .frame(width: 125, height: 200, alignment: .center)
                    .shadow(radius: 20)
                VStack{
                    Text("Paparazzi Pro")
                        .font(.custom(Constants.MONTSERRAT_LIGHT, size: 15))
                        .foregroundColor(Color(.white))
                    Image("roll")
                        .rotationEffect(.init(degrees: self.animate ?  360 : 0))
                        .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                    Text("Please Wait!")
                    .font(.custom(Constants.MONTSERRAT_REGULAR, size: 13))
                    .foregroundColor(Color(.white))

                }.onAppear(){
                    self.animate.toggle()
                }
            
            .padding()
            }.background(Color.black)
            .opacity(0.40)
            .cornerRadius(Constants.RADIUS_VIEW_CORNER)
        }
    }
    }

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Group{
//            LogInView()
//                .previewDevice("iPhone 11 Pro Max")
            Loader()
            }
        }
        
}
