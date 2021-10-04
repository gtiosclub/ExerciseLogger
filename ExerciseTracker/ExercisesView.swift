//
//  ExercisesView.swift
//  ExerciseTracker
//
//  Created by Jai Chawla on 10/4/21.
//

import SwiftUI

struct ExercisesView: View {
    @ObservedObject var myExercises: MyExercises
    @State var goToAddExerciseView = false
    var body: some View {
        NavigationView {
            VStack {
                if myExercises.exercises.count > 0 {
                    List {
                        ForEach(myExercises.exercises) { exercise in
                            ExercisesListView(exercise: exercise)
                        }
                    }
                } else {
                    Text("Click on the plus button to log your first set.")
                }
                
                NavigationLink(destination: AddExerciseView(myExercises: self.myExercises), isActive: self.$goToAddExerciseView) {
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.goToAddExerciseView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle(Text("Exercise Log"))
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(myExercises: MyExercises())
    }
}
