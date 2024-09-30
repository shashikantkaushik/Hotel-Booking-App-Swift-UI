//
//  DestinationSearchView.swift
//  airBnb
//
//  Created by Shashi Kant on 19/09/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show:Bool
    @State private var destination=""
    @State private var selectedOptions:DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest=0
    var body: some View {
        VStack{
            
            HStack{
                Button{
                    show.toggle()
                }
            label:{
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
                Spacer()
                
                if destination.isEmpty{
                    Button("Clear"){
                        destination=""
                    }
                    
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            VStack(alignment: .leading){
                if selectedOptions == .location{
                    Text("Where to?")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8 ).stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else{
                    CollapsedPickerView(title: "Where", desciption: "Add destination")
                        
                }
                
            }
            .modifier(CollpsableDestinationViewModifier())
            .frame(height: selectedOptions == .location ? 120:64)
            .onTapGesture {
                withAnimation(.snappy){ selectedOptions = .location}
            }
            
            
            
            VStack(alignment : .leading){
                if selectedOptions == .dates{
                    
                        Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)

                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                   

                }
                else{
                    CollapsedPickerView(title: "When", desciption: "Add dates")
                    
                }
            }
            .modifier(CollpsableDestinationViewModifier())
            .frame(height: selectedOptions == .dates ? 180:64)
            .onTapGesture {
                withAnimation(.snappy){ selectedOptions = .dates}
            }
            VStack{
                if selectedOptions == .guests{
                        Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuest) Adults")
                    } onIncrement: {
                        numGuest+=1
                    } onDecrement: {
                        guard numGuest > 0 else {return}
                        numGuest-=1
                    }
                }
                else{
                    CollapsedPickerView(title: "Who", desciption: "Add guests")
                    
                }
            }
            .modifier(CollpsableDestinationViewModifier())
            .frame(height: selectedOptions == .guests ? 120:64)
            
            .onTapGesture {
                withAnimation(.snappy){ selectedOptions = .guests}
            }
            
        }
        Spacer()
    }
    
}
#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollpsableDestinationViewModifier: ViewModifier{
    func  body(content:Content)->some View{
        content
            .padding()
             .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        
    }
}

struct CollapsedPickerView: View {
    let title:String
    let desciption:String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(desciption)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
