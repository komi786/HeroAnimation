//
//  ContentView.swift
//  HeroAnimation
//
//  Created by Komal Gilani on 18/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var images = [
     "aidkit",
     "doublebed",
     "bandaid",
     "drugs",
     "heart",
     "xmark"
    ]
    @State private var selectedimages  : [String] = []
    var body: some View {
        VStack {
            Text("All Images")
                .font(.headline)
            allImagesView
            
            Spacer()
            Text("Selected Images")
                .font(.headline)
            selectedImagesView
         
           
        }
        .padding()
    }

    private var allImagesView : some View {
    LazyVGrid(columns: [.init(.adaptive(minimum: 88))]){
        
        ForEach(images, id:\.self) {
            image in
            
            Image(image)
                .resizable()
                .frame(width: 44,height: 44)
                .onTapGesture{
                    withAnimation {
                        images.removeAll{$0 ==  image}
                        selectedimages.append(image)
                    }
                }
            
        }
       }
    }
    
    private var selectedImagesView : some View {
    LazyVGrid(columns: [.init(.adaptive(minimum: 88))]){
        
        ForEach(selectedimages, id:\.self) {
            image in
            
            Image(image)
                .resizable()
                .frame(width: 44,height: 44)
                .onTapGesture{
                    withAnimation {
                        selectedimages.removeAll{$0 ==  image}
                        images.append(image)
                    }
                }
            
        }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
