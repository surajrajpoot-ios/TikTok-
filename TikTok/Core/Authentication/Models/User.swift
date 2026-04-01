//
//  User.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import Foundation
import SwiftUI
import FirebaseAuth
struct User:Codable{
    let uid: String
    let email: String
    let name: String
}
