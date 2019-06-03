//
//  CV.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-01.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import Foundation

struct CV: Decodable {
    let name: String
    let summary: String
    let knowledges: [Knowledge]
    let experiences : [Experience]
    
    init() {
        self.name = "NA"
        self.summary = "NA"
        self.knowledges = []
        self.experiences = []
    }

}

struct Knowledge: Decodable {
    let id : Int?
    let title : String?
    let description : String?
}

struct Experience: Decodable {
    let id : Int?
    let companyName : String?
    let location : String?
    let roleName : String?
    let dateFrom : String?
    let dateTo : String?
    let responsibilities : String?
    let achievements : String?

    let companyLogo : String?
}


