//
//  AuthorsViewModel.swift
//  MyAuthorsSwiftUI-API
//
//  Created by Pablo De La Cruz on 7/20/22.
//

import Foundation

//TODO: Support Spanish language 
class AuthorViewModel: ObservableObject {
    @Published var authors: [Author] = []

    //Wont need escaping completion handler since we are going to set our published variable inside this func scope
    //seperate logic to services folder as required/needed
    func getData() {
        guard let apiUrl = URL(string: "https://mocki.io/v1/e860a172-2605-4afe-bcba-dfd071e8256e") else { return }

        let task = URLSession.shared.dataTask(with: apiUrl) { [weak self] data, response, error in
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode([Author].self, from: data)

                //Rows of the author list should be sorted by name
                //Set published variable authors
                DispatchQueue.main.async {
                    self?.authors = result.sorted { $0.authorName < $1.authorName }
                }
            } catch {
                //Print out proper errors for easy debugging:
                print("errors trying to decode", error)
            }
        }
        //using task varible so .resume() makes more sense
        task.resume()
    }
}
