//
//  ProfileView.swift
//  airBnb
//
//  Created by Shashi Kant on 30/09/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    Text("Login to start planning your next trip")
                }
                Button{
                    
                } label:{
                    Text("Login In")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                HStack{
                    Text("Don't have an account")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
        
                    
                }.font(.caption)
                
            }
            VStack(spacing:24){
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
