//
//  HouseMemberViewModel.swift
//  TerraceHouse
//
//  Created by Alvin Tu on 6/2/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import Foundation
struct HouseMemberViewModel{
    private var _englishNameLabelString: String!
    var englishnameLabelString: String{
        return _englishNameLabelString
    }
    
    private var _japanesenameLabelString: String!
    var japaneseNameLabelString: String {
        return _japanesenameLabelString
    }
    
    private var _professionLabelString : String!
        var professionLabelString: String {
            return _professionLabelString
        }
    
    private var _ageLabelString : String!
    var ageLabelString: String {
        return _ageLabelString
    }
    
    private var _instagramLink : String!
    var instagramLink: String {
        return _instagramLink
    }

    
    init(member: HouseMember) {
        self._englishNameLabelString = member.englishName
        self._japanesenameLabelString = member.japaneseName
        self._professionLabelString = member.profession
        self._ageLabelString = member.age
        self._instagramLink = member.instagramLink

    }

}
