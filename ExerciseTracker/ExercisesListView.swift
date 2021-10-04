//
//  ExercisesListView.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import SwiftUI

struct ExercisesListView: View {
    var exercise: Exercise
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Exercise: \(exercise.name)")
            
            Text("Reps: \(exercise.reps)")
            
            Text("Weight: \(exercise.weight)")
            
            Text("Date: \(convertDateToString())")
        }
    }
    
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY"
        return dateFormatter.string(from: exercise.date)
    }
}

struct ExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesListView(exercise: Exercise(name: "Pushups", reps: 10, weight: 0, date: Date()))
    }
}
