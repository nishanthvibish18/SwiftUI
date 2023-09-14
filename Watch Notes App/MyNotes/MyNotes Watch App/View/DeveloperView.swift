//
//  DeveloperView.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import SwiftUI

struct DeveloperView: View {
    
    private var ranodmNumber = Int.random(in: 1...3)
    
    private func getImages() -> String{
        return "developer-no\(self.ranodmNumber)"
    }
    
    var body: some View {
        VStack(alignment: .center,spacing: 5) {
            
            Image(getImages())
                .resizable()
                .scaledToFit()
        
            
            HeaderTitleView(title: "credits".uppercased())
            
            
            Text("Vibish & Kavi")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Developer")
                .font(.headline)
                .foregroundColor(.secondary)
            
        }
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
