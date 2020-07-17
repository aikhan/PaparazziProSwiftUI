//
//  ContentView.swift
//  Paparazzi Pros SwiftUI
//
//  Created by Asad Khan on 14/07/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import SwiftUI


struct LogInView: View {
    @State private var userName = ""
    @State private var password = ""
    @ObservedObject var loginViewModel =  LoginViewModel(withEmail: "", andPassword: "")
    @State private var showAlert = false
    
    @ViewBuilder
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                if self.loginViewModel.isLoading{
                    Loader().zIndex(1.0).shadow(radius: 30)
                }else{
                    Loader().zIndex(0.0)
                    .hidden()
                }
                Image("background_login")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    Image("Logo")
                    ScrollView {
                        ZStack {
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .fill(Color(hex: Constants.COLOR_MAIN_BACKGROUND))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            VStack{
                                Text("LOG IN")
                                    .font(.custom(Constants.MONTSERRAT_BOLD, size: Constants.FONT_SIZE_MAIN))
                                    .foregroundColor(Color(hex: Constants.COLOR_FONT_HEADINGS))
                                    .padding(20)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: Constants.RADIUS_SUBVIEW_CORNER, style: .continuous)
                                        .fill(Color(hex: Constants.COLOR_MAIN_BACKGROUND))
                                    VStack{
                                       
                                        //Username
                                        HStack{
                                            TextField("User Name", text: self.$userName)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_REGULAR))
                                                .padding(10)
                                                .foregroundColor(Color(.black))
                                            Image("User Icon")
                                                .padding(.trailing, -2)
                                        }.background(Color.white)
                                         .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                            .padding(.bottom, 5)
                                        
                                        //Password
                                        HStack{
                                            SecureField("Password", text: self.$password)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_REGULAR))
                                                .padding(10)
                                                .foregroundColor(Color(.black))
                                            Image("Lock Icon")
                                                .padding(.trailing, -2)
                                        }.background(Color.white)
                                            .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                            .padding(.bottom, 10)
                                        
                                        //LOGIN Button
                                        Button(action: {
                                            print("I have been clicked")
                                                self.loginViewModel.authenticateUser(withUsername: self.userName, andPassword: self.password)
                                        }) {
                                            Text("LOG IN")
                                            .padding(12)
                                            .foregroundColor(Color.white)
                                            .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_MAIN))
                                            .frame(maxWidth: .infinity)
                                            .background(Color(hex: Constants.COLOR_BUTTON_RED_BRIGHT))
                                                .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                        }.alert(isPresented: self.$showAlert) {
                                            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                                        }
//                                        self.loginViewModel.isLoggedIn ? Text("LoggedIn") : Text("NOT LoggedIn")
                                        
                                        //Forgot password
                                        Button(action: {
                                            print("Forgot username / Reset password")
                                        }) {
                                            Text("Forgot Username / Reset Password")
                                            .padding(5)
                                            .foregroundColor(Color(hex: Constants.COLOR_PLACEHOLDER_TEXT))
                                            .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_REGULAR))
                                            .padding(.bottom)
                                        }
                                       
                                        //Facebook Button
                                        Button(action: {
                                            print("I have been clicked")
                                        }) {
                                            Text("LOG IN WITH FACEBOOK")
                                                .padding(12)
                                                .foregroundColor(Color.white)
                                                .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_MAIN))
                                                .frame(maxWidth: .infinity)
                                                .background(Color(hex: Constants.COLOR_BUTTON_FACEBOOK))
                                                .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                        }.padding(.bottom)
                                        
                                        //Google Button
                                        Button(action: {
                                            print("I have been clicked")
                                        }) {
                                            Text("LOG IN WITH GOOGLE")
                                                .padding(12)
                                                .foregroundColor(Color.white)
                                                .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_MAIN))
                                                .frame(maxWidth: .infinity)
                                                .background(Color(hex: Constants.COLOR_BUTTON_RED_DARK))
                                                .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                        }.padding(.bottom)
                                    }
                                }.padding(20)
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                    VStack{
                                        Text("Not a Paparazi Pro member?")
                                            .font(.custom(Constants.MONTSERRAT_BOLD, size: Constants.FONT_SIZE_REGULAR))
                                            .foregroundColor(Color(hex: Constants.COLOR_PLACEHOLDER_TEXT))
                                            .padding(.top, 50)
                                            .padding(.bottom)
                                            .frame(maxWidth: .infinity)
                                        
                                        //LOGIN Button
                                        Button(action: {
                                            print("create account clicked")
                                        }) {
                                            Text("CREATE ACCOUNT")
                                                .padding(12)
                                                .foregroundColor(Color.white)
                                                .font(.custom(Constants.MONTSERRAT_LIGHT, size: Constants.FONT_SIZE_MAIN))
                                                .frame(maxWidth: .infinity)
                                                .background(Color(hex: Constants.COLOR_BUTTON_RED_BRIGHT))
                                                .cornerRadius(Constants.RADIUS_SUBVIEW_CORNER)
                                            .padding(20)
                                        }.padding(.bottom, 30)
                                    }
                                }.cornerRadius(Constants.RADIUS_VIEW_CORNER, corners: [.bottomLeft, .bottomRight])
                            }
                        }
                        .padding()
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LogInView()
                .previewDevice("iPhone SE")
            LogInView()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
}
