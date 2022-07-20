//
//  BooksViewModel.swift
//  MyAuthorsSwiftUI-API
//
//  Created by Pablo De La Cruz on 7/20/22.
//

import Foundation

//Not being used to keep it simple
class BooksViewModel: ObservableObject {
    @Published var image: String = ""
    @Published var name: String = ""
    @Published var pages: Int = 0
    @Published var releaseDate: String = ""
}
