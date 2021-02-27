//
//  HouseMember.swift
//  TerraceHouse
//
//  Created by Alvin Tu on 5/30/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import Foundation

struct SeasonFiveMembers: Codable {
    let seasonFiveMembers:[HouseMember]
}
struct HouseMember: Codable {
    let englishName:String
    let japaneseName:String
    let profession:String
    let age:String
    let episodes:String
    let numberOfEpisodes:String
    let instagramLink:String
}

