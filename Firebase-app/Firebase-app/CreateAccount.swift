//
//  CreateAccount.swift
//  Firebase-app
//
//  Created by Noura Alowayid on 16/11/1444 AH.
//

import SwiftUI
import FirebaseCore
//import FirebaseFirestore
import FirebaseAuth

struct CreateAccount: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var showPassword: Bool = false
    var pass: String
    var body: some View {
        NavigationStack{
            VStack{
                Image("LogoImage")
                    .resizable()
                    .frame(width: 107, height: 117)
                
                VStack(spacing: 15) {
                    TextField("Email", text: $email )
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                                .shadow(radius: 30)
                        }.frame(width:300).padding()
                    TextField("Username", text: $username )
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                                .shadow(radius: 30)
                        }.frame(width:300).padding()
                }
            
                    .padding(.top,16)
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
                }.padding()
                textFieldPassSign(pass: "Confirm Password").padding()
                NavigationLink( destination: SignIn()){
                    Button("Create Account"){
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if error == nil {
                                print("تم انشاء حساب جديد")
                            } else{
                                print("حدث خطأ ما")
                            }
                        }
                    }
                }
                .frame(maxWidth: 150, maxHeight: 6)
                .padding()
                .buttonStyle(.bordered)
                .background(Color("rred"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top)
            }
                    HStack{
                        Text("Forget your password?")
                            .frame(width: 200)
                            .padding(.top)
                            .foregroundColor(Color.secondary)
                        
                    }.frame(maxWidth: .infinity)
                        .padding(.leading,170)
                }
            }
        }

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount(pass: "Password")
    }
}
