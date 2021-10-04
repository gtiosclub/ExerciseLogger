//
//  Exercise.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import Foundation


enum ExerciseCodingKeys: CodingKey {
    case id, name, reps, weight, date
}

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var name: String
    var reps: Int
    var weight: Int
    var date: Date
    
    init(name: String, reps: Int, weight: Int, date: Date) {
        self.name = name
        self.reps = reps
        self.weight = weight
        self.date = date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ExerciseCodingKeys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.reps = try container.decode(Int.self, forKey: .reps)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ExerciseCodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(reps, forKey: .reps)
        try container.encode(weight, forKey: .weight)
        try container.encode(date, forKey: .date)
    }
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



