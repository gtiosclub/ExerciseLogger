//
//  ExerciseTrackerApp.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import SwiftUI

@main
struct ExerciseTrackerApp: App {
    @StateObject var myExercises = MyExercises()
    
    var body: some Scene {
        WindowGroup {
            ExercisesView(myExercises: myExercises)
        }
    }
}
