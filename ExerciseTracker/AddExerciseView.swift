//
//  AddExerciseView.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import SwiftUI

struct AddExerciseView: View {
    @State var exerciseName: String = ""
    @State var exerciseReps: String = ""
    @State var exerciseWeight: String = ""
    @State var showAlert = false
    @ObservedObject var myExercises: MyExercises
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            TextField("Exercise Name", text: $exerciseName)
            
            TextField("Number of Reps", text: $exerciseReps)
                .keyboardType(.decimalPad)
            
            TextField("Weight", text: $exerciseWeight)
                .keyboardType(.decimalPad)

            Button(action: {
                myExercises.addExercise(exercise: Exercise(name: exerciseName, reps: exerciseReps == "" ? 0 : Int(exerciseReps)!, weight: exerciseWeight == "" ? 0 : Int(exerciseWeight)!))
                self.showAlert = true
            }, label: {
                Text("Add Set")
            })
            
        }
        .padding(.horizontal, 15)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"), message: Text("Set added to your log."), dismissButton: .default(Text("Ok")))
        }
        .navigationBarTitle("New Set", displayMode: .inline)
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(myExercises: MyExercises())
    }
}
