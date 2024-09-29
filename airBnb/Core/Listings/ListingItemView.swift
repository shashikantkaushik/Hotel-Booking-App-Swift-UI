//
//  ListingView.swift
//  airBnb
//
//  Created by Shashi Kant on 16/09/24.
//

import SwiftUI

struct ListingItemView: View {
   
    var body: some View {
        VStack(spacing:8){
            //images
            
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
               



            
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading){
                    Text("Miami, Florida").fontWeight(.semibold).foregroundStyle(.black)
                    Text("12 mi away").foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing:4){
                        Text("567").fontWeight(.semibold).foregroundStyle(.black)
                        Text("night").foregroundStyle(.black)
                    }
                }
                
                Spacer()
                //ratings
                
                HStack(spacing:2){
                    Image(systemName:"star.fill")
                    Text("4.86")
                }.foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
