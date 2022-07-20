//
//  ContentView.swift
//  MyAuthorsSwiftUI-API
//
//  Created by Pablo De La Cruz on 7/20/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AuthorViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.authors, id: \.self) { author in
                    HStack {
                        NavigationLink(destination: BooksContentView(books: author.books, authorName: author.authorName)) {
                            Text(author.authorName)
                                .bold()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
                .navigationTitle("My Authors")
                .onAppear {
                viewModel.getData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
