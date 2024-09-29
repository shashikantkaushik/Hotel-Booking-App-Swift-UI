//
//  ListingImageCarouselView.swift
//  airBnb
//
//  Created by Shashi Kant on 17/09/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images=[
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4"
    ]
    var body: some View {
        TabView{
            ForEach(images, id: \.self){
                image in Image(image).resizable().scaledToFill()
            }
        }
        .tabViewStyle(.page)
        
        
        //listing details
    }
}

#Preview {
    ListingImageCarouselView()
}
