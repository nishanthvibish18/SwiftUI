//
//  NoteModel.swift
//  MyNotes Watch App
//
//  Created by Nishanth Vibi on 14/09/23.
//

import Foundation


struct NoteModel: Codable, Identifiable{
    let id:UUID
    let name: String
}
