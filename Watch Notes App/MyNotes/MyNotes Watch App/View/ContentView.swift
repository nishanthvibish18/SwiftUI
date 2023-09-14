//
//  ContentView.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notesTextField: String = ""
    @AppStorage("lineLimit") var lineLimit: Int = 1
    @State private var noteArray: [NoteModel] = [NoteModel]()
    
    private func getLocalURL() -> URL{
        let fileManager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return fileManager[0]
    }
    
    
    private func saveData(){
        
        do{
            let notes = try JSONEncoder().encode(noteArray)
            
            let urlPath = getLocalURL().appendingPathComponent("notes")
            
            try notes.write(to: urlPath)
            
        }
        catch{
            print("unable to save the data into the local storage")
        }
    }
    
    
    private func deletItems(index: IndexSet){
        withAnimation {
            self.noteArray.remove(atOffsets: index)
            self.saveData()
        }
    }
    
    private func getNotesData(){
        DispatchQueue.main.async {
            do{
                let urlPath = getLocalURL().appendingPathComponent("notes")
                let notesData = try Data(contentsOf: urlPath)
                self.noteArray = try JSONDecoder().decode([NoteModel].self, from: notesData)
            }
            catch{
                print("unable to find notes")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                
                HStack(alignment: .center,spacing: 6) {
                    
                    TextField("Enter Your Notes", text: $notesTextField)
                    
                    Button {
                        
                        guard notesTextField.isEmpty == false else{ return }
                        
                        
                        let noteData = NoteModel(id: UUID(), name: notesTextField)
                        
                        
                        self.noteArray.append(noteData)
                        
                        self.notesTextField = ""
                        
                        self.saveData()
                        
                        
                    } label: {
                        
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42,weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                }
                
                Spacer()

                if self.noteArray.count > 0 {
                    List {
                        ForEach(0..<self.noteArray.count, id: \.self){ i in
                            
                            NavigationLink(destination: NotesDetailsView(notes: self.noteArray[i])) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(noteArray[i].name)
                                        .lineLimit(self.lineLimit)
                                        .padding(.leading, 5)
                                }
                            }
                        }
                        .onDelete(perform: self.deletItems)
                    }
                }
                else{
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .padding(25)
                    
                }
                
                
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.getNotesData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
