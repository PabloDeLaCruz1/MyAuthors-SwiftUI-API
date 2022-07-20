//
//  ImageData.swift
//  MyAuthorsSwiftUI-API
//
//  Created by Pablo De La Cruz on 7/20/22.
//

import SwiftUI

//For the API we are using to get images, will need to set App Transport Security Settings -> Allow Arbitrary Loads to yes
//TODO: Cache images
struct URLImage: View {
    let urlString: String

    @State var data: Data?

    var body: some View {
        if let data = data, let uiImage = UIImage(data: data){
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 135, height: 75)
        } else {
            //Handles missing images and provides a proper placeholder
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 135, height: 75)
                .background(Color.blue)
                .onAppear {
                    fetchData()
            }
        }
    }

    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            self.data = data
        }
        task.resume()
    }
}
