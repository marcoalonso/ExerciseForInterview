//
//  TaskItem.swift
//  Exercise
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import Foundation

struct TaskItem: Codable {
    let title: String
    let details: Details
}

struct Details: Codable {
    let description: String
    let day : Int
}
