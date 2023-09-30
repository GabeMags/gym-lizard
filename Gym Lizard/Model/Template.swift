//
//  Template.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import Foundation

struct Template: Hashable, Identifiable {
    let id = UUID()
    let name: String //Push day, Pull day, etc
    let lastPerformed: String //5 days ago, etc
    let workoutData: [String: [[String: Int]]] //[workoutTitle: [[pounds: int], [reps: int]]
    
    // Computed property to calculate the number of sets for each workoutTitle
    var setsPerWorkout: [String: Int] {
        var setsCountPerWorkout = [String: Int]()
        for (workoutTitle, sets) in workoutData {
            setsCountPerWorkout[workoutTitle] = sets.count
        }
        return setsCountPerWorkout
    }
}

struct MockData {
    let id = UUID()
    
    static let sampleTemplatePushDay = Template(name: "Push",
                                         lastPerformed: "5 days ago",
                                         workoutData: ["Overhead Presssssssssssssssssssssssssss":    [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Press":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6], ["pounds": 240, "reps": 6]],
                                                       "Chest Dip":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extension": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pres":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest Di":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensio": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pre":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest D":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensi": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]]])
    
    static let sampleTemplatePullDay = Template(name: "Pull Day",
                                         lastPerformed: "2 days ago",
                                         workoutData: ["Overhead Presssssssssssssssssssssssssss":    [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Press":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6], ["pounds": 240, "reps": 6]],
                                                       "Chest Dip":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extension": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pres":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest Di":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensio": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pre":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest D":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensi": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]]])
    
    static let sampleTemplateLegDay = Template(name: "Leg Day",
                                         lastPerformed: "69 days ago",
                                         workoutData: ["Overhead Presssssssssssssssssssssssssss":    [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Press":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6], ["pounds": 240, "reps": 6]],
                                                       "Chest Dip":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extension": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pres":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest Di":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensio": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Bench Pre":       [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Chest D":         [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]],
                                                       "Triceps Extensi": [["pounds": 200, "reps": 10], ["pounds": 220, "reps": 8], ["pounds": 240, "reps": 6]]])
}
