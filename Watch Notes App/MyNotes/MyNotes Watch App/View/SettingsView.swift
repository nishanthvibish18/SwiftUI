//
//  SettingsView.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineLimit") var lineLimit: Int = 1
    
    @State private var lineLimitSlider: CGFloat = 1.0
    
    private func updateSlider(){
        lineLimit = Int(lineLimitSlider)
    }
    
    var body: some View {
        
        VStack(alignment: .center,spacing: 3){
            
            HeaderTitleView(title: "Settings".uppercased())
            
            Text("Lines: \(lineLimit)".uppercased())
                .font(.title2)
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.lineLimitSlider
            }, set: { (newValue) in
                self.lineLimitSlider = newValue
                self.updateSlider()
            }), in: 1...4,step: 1)
            .foregroundColor(.accentColor)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
