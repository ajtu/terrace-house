//
//  Services.swift
//  TerraceHouse
//
//  Created by Alvin Tu on 5/30/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()

    func fetchMembers(completion: @escaping ([HouseMember], Error?) -> ()) {
        if let filepath = Bundle.main.path(forResource: "members", ofType: "json"){
            do
            {
                let contents = try String(contentsOfFile: filepath)
                if let dictionary = convertToDictionary(text: contents),
                    let membersArray = dictionary["seasonFiveMembers"],
                    let membersString = json(from: membersArray),
                    let json = membersString.data(using: .utf8){
                    
                    do {
                        let members = try JSONDecoder().decode([HouseMember].self, from: json)
                        DispatchQueue.main.async {
                            return completion(members,nil)
                        }
                    } catch let jsonErr {print("Failed to decode:", jsonErr)}
                }
            }
            catch {print("Contents could not be loaded.")}
        }
    }
}

//helper functions
extension Service
{
    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    private func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
