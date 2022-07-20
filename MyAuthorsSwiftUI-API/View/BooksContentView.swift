//
//  BooksContentView.swift
//  MyAuthorsSwiftUI-API
//
//  Created by Pablo De La Cruz on 7/20/22.
//

import SwiftUI

struct BooksContentView: View {
    var books = [Book]()
    var authorName = ""
    
    var body: some View {
        List {
            ForEach(books, id: \.self) { book in
                HStack {
                    //TODO: align a per requirements
                    URLImage(urlString: book.coverImage)
                    VStack {
                        Text(book.title )
                                .bold()
                        Text("Pages: " + String(book.pages))
                        Text("Release Date: " + book.releaseDate)
                    }
                }
            }
        }
            .navigationTitle(authorName)
    }
}

struct BooksContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksContentView()
    }
}
