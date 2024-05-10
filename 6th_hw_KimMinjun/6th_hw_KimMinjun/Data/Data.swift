////
////  Data.swift
////  6th_hw_KimMinjun
////
////  Created by 김민준 on 5/7/24.
////
//
//
//
import UIKit

struct Data: Decodable, Encodable{
    let id : Int?
    let name : String
    let part : String
    let age : Int
    
    init(name: String, part: String, age: Int){
        self.id = nil
        self.name = name
        self.part = part
        self.age = age
    }
}

//
//struct MemberData: Decodable, Encodable {
//    let id: Int?
//    let name: String
//    let part: String
//    let age: Int
//    
//    init(id: Int? = nil, name: String, part: String, age: Int) {
//        self.id = id
//        self.name = name
//        self.part = part
//        self.age = age
//    }
//}
