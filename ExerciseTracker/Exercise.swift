//
//  Exercise.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var name: String
    var reps: Int
    var weight: Int
}

class MyExercises: Identifiable, ObservableObject {
    var id = UUID()
    @Published var exercises: [Exercise]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedExercises") {
            if let decoded = try? JSONDecoder().decode([Exercise].self, from: data) {
                self.exercises = decoded
                return
            }
        }
        self.exercises = []
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(exercises) {
            UserDefaults.standard.set(encoded, forKey: "SavedExercises")
        }
    }
    
    func addExercise(exercise: Exercise) {
        exercises.insert(exercise, at: 0)
        save()
    }
}
