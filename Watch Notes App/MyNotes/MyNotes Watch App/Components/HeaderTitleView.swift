//
//  HeaderTitleView.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import SwiftUI

struct HeaderTitleView: View {
    var title: String = ""
    var body: some View {
        
        VStack{
            if title != ""{
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            HStack {
                Capsule().frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule().frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }

    }
}

struct HeaderTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTitleView()
    }
}
