

import Foundation

class TopArtists{
    // properties
    var topArtists : [Artist]
    
    // init
    init(topArtists: [Artist]) {
        self.topArtists = topArtists
    }
    
    init(){
        self.topArtists =
        [
            Artist(name: "Sabin Tabirca", genre: "12345678", popularSongs: "sabin@ucc.ie", url: "https://www.ucc.ie", image: "sabin.jpg"),
            Artist(name: "Sabina Tabirca", genre: "12345678", popularSongs: "sabin@ucc.ie", url: "https://www.ucc.ie", image: "sabin.jpg"),
            Artist(name: "Saby Tabirca", genre: "12345678", popularSongs: "sabin@ucc.ie", url: "https://www.ucc.ie", image: "sabin.jpg"),
            Artist(name: "Sabine Tabirca", genre: "12345678", popularSongs: "sabin@ucc.ie", url: "https://www.ucc.ie", image: "sabin.jpg")
        ]
    }
    
    init(xmlFile:String){
        // make topArtistsParser and parsing
        let topArtistsParser = XMLArtistsParsing(fileName: xmlFile)
        topArtistsParser.parsing()
        
        // get the dat from it
        self.topArtists = topArtistsParser.topArtistsData
        
    }
    
    //methods
    func count()->Int{return self.topArtists.count}
    func artist(index:Int)->Artist{return self.topArtists[index]}
    func allArtists() -> [Artist] {
        return self.topArtists
    }
}
