//
//  DataLoader.swift
//  moodboard
//
//  Created by Madison Ramos on 6/16/21.
//

import Foundation

public class DataLoader {
    
    @Published var mediaData = [MediaInfo]()
    
    init(file : String) {
        load(fileName: file)
    }
    
    func load(fileName : String) {
        
        if let fileLocation = Bundle.main.url(forResource: fileName, withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([MediaInfo].self, from: data)
                self.mediaData = dataFromJson
            } catch {
                print(fileName)
                print(error)
            }
        }
    }
    
}
