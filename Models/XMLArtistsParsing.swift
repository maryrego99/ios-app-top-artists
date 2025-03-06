

import Foundation

class XMLArtistsParsing:NSObject, XMLParserDelegate{
    
    var fileName:String
    
    init(fileName: String) {self.fileName = fileName}
    
    //MARK: - vars to work parsing
    
    // tmp vars to store person data
    var aName, aGenre, aPopularSongs, aUrl, aImage, aSongUrl : String!
    
    // spy vars to work in the delegate methods
    var passElement : Int = -1
    var passData : Bool = false
    
    // data objects
    var personData : Artist!
    var topArtistsData = [Artist]()
    
    // xml parsing elements
    var parser : XMLParser!
    var tags = ["name", "genre", "popularSongs", "website", "image", "songUrl"]
    
    //MARK: - parsing delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // got a start tag that we need to spy if is one of the tags
        if tags.contains(elementName){
            passData = true
            passElement = tags.firstIndex(of: elementName)!
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // check the spies to decide what to save in p-vars
        if passData{
            switch passElement{
            case 0 : aName = string
            case 1 : aGenre = string
            case 2 : aPopularSongs = string
            case 3 : aUrl = string
            case 4 : aImage = string
            case 5 : aSongUrl = string
            default:
                break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // reset the spies to false when elementName is in tags
        if tags.contains(elementName){
            passData = false
            passElement = -1
        }
        
        // check if </person>
        if elementName == "artist"{
            // create personData and append it to peopleData
            personData = Artist(name: aName, genre: aGenre, popularSongs: aPopularSongs, url: aUrl, image: aImage, songUrl: aSongUrl)
            topArtistsData.append(personData)
        }
        
    }
    
    func parsing(){
        // get the xml file url
        let bundleURL = Bundle.main.bundleURL
        let fileURL = URL(string: self.fileName, relativeTo: bundleURL)
        
        // make the parser and delegate it
        parser = XMLParser(contentsOf: fileURL!)
        parser.delegate = self
        
        // parse
        parser.parse()
    }
    
    
    
}
