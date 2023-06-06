//
//  SignIn.swift
//  Firebase-app
//
//  Created by Noura Alowayid on 16/11/1444 AH.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        VStack(){
            Image("LogoImage")
                .resizable()
                .frame(width: 107, height: 117)
            textFieldEmailSign()
                .padding(.top,16)
            textFieldPassSign( pass: "Password")
                .padding()
            Text("LogIn")
                .frame(maxWidth: 100, maxHeight: 6)
                .padding()
                .buttonStyle(.bordered)
                .background(Color("rred"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            HStack{
                Text("Forget your password?")
                    .frame(width: 200)
                    .padding(.top)
                    .foregroundColor(Color.secondary)
                
            }.frame(maxWidth: .infinity)
                .padding(.leading,130)
        }
    }
}
struct textFieldEmailSign: View {
    @State var email: String = ""
    var body: some View {
        VStack(spacing: 15) {
            TextField("Email", text: $email )
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                        .shadow(radius: 30)
                }.frame(width:300).padding()
        }
    }
}
struct textFieldPassSign: View {
    @State var password: String = ""
    @State var showPassword: Bool = false
    var pass: String
    var body: some View {
            ZStack {
                Group {
                    if showPassword {
                        TextField("",
                                  text: $password,
                                  prompt: Text(""))
                    } else {
                        SecureField(pass,
                                    text: $password)
                    }
                }.padding(10).overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2).shadow(radius: 30)
                }.frame(width:300)
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye").foregroundColor(.gray).padding(.leading,240)
                }
            }
        }
    }
struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
