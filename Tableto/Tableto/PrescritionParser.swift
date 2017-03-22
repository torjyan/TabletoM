//
//  PrescritionParser.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/19/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import Foundation


class PrescriptionParser{
    
    func parsePrescrition(nameOfDrug: String)->[String]{
        let str = nameOfDrug[nameOfDrug.startIndex]
        let htmlString = "http://www.rxlist.com/drugs/alpha_\(str).html"
        print("****************IN HERE*******************")
        print(htmlString)
        let request = NSMutableURLRequest(url: URL(string: htmlString)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5)
        request.httpMethod = "POST" // POST ,GET, PUT What you want
        
        
        //let session = URLSession.shared
        var tabOfDrugs = [String]()
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in
            
            do {
                
                var htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("PARSING")
                print(htmlContent)
                
                var toBeParsed = (htmlContent as! String)
                var searchRange = toBeParsed.startIndex..<toBeParsed.endIndex
                var result = toBeParsed.range(of: "</a><span class", options: NSString.CompareOptions.literal, range: toBeParsed.startIndex..<toBeParsed.endIndex, locale: nil)
                
                while let range = toBeParsed.range(of: "</a><span", options: .caseInsensitive, range: searchRange) {
    
                    searchRange = range.upperBound..<searchRange.upperBound
                                        let drug = toBeParsed.between("-drug.htm\">", "</a><span")
                    
                   // print(drug)
                    if(drug != nil){
                        tabOfDrugs.append(drug!)
                    }
                    let delRange = toBeParsed.startIndex..<range.upperBound
                    toBeParsed.removeSubrange(delRange)
                    searchRange = toBeParsed.startIndex..<toBeParsed.endIndex
                }
                print("Length \(tabOfDrugs.count)")
                var count = 0
                for drug in tabOfDrugs {
                  //  print(drug)
                    if (drug.lowercased().range(of: nameOfDrug) != nil){
                        print(drug)
                    }
                    count += 1
                  //  print(count)
                }
                
            }
        
        }
        
        
        dataTask.resume()
        return tabOfDrugs
    }
    
}




extension String {
    
    func between(_ left: String, _ right: String) -> String? {
        
        guard
            let leftRange = range(of: left), let rightRange = range(of: right, options: .caseInsensitive)
            , left != right && leftRange.upperBound < rightRange.lowerBound
            else { return nil }
        
        let sub = self.substring(from: leftRange.upperBound)
        let closestToLeftRange = sub.range(of: right)!
        return sub.substring(to: closestToLeftRange.lowerBound)
    }
    
    func countInstances(of stringToFind: String) -> Int {
        var stringToSearch = self
        var count = 0
        repeat {
            guard let foundRange = stringToSearch.range(of: stringToFind, options: .diacriticInsensitive)
                else { break }
            stringToSearch = stringToSearch.replacingCharacters(in: foundRange, with: "")
            count += 1
            
        } while (true)
        
        return count
    }
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func indexes(of string: String, options: CompareOptions = .literal) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
}
