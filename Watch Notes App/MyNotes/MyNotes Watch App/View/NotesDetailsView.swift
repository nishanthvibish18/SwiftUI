//
//  NotesDetailsView.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import SwiftUI

struct NotesDetailsView: View {
    
    var notes: NoteModel
    
    @State private var isShowSettingsView: Bool = false
    
    @State private var isDisplayInfoView: Bool = false
    
    var body: some View {
        VStack(){
            
            HeaderTitleView()
            
            Spacer()
            
            ScrollView(.vertical,showsIndicators: false){
                Text(notes.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
        }
        
        Spacer()
        
        HStack(alignment: .center) {
            Button {
                isShowSettingsView = true
            } label: {
                Image(systemName: "gear")
                    .imageScale(.large)
            }
            .sheet(isPresented: $isShowSettingsView) {
                SettingsView()
            }

            
            Spacer()
            
            
            Button {
                isDisplayInfoView = true
            } label: {
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }
            .sheet(isPresented: $isDisplayInfoView) {
                DeveloperView()
            }

        }
        .foregroundColor(.secondary)
        
    }
}

struct NotesDetailsView_Previews: PreviewProvider {
    static let notes = NoteModel(id: UUID(), name: "This is test description")
    static var previews: some View {
        NotesDetailsView(notes: notes)
    }
}
