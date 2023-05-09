//
//  ContentView.swift
//  Bookworm
//
//  Created by Taras Kyparenko on 8/5/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct ContentView: View {
////    @AppStorage("notes") private var notes = ""
//    @State private var rememberMe = false
//
//    var body: some View {
////        NavigationView {
////            VStack{
////                TextEditor(text: $notes)
////                    .navigationTitle("Notes")
////                    .padding()
////            }
//            VStack {
//                PushButton(title: "Remember Me", isOn: $rememberMe)
//                Text(rememberMe ? "ON" : "OFF")
//            }
////        }
//    }
//
//    struct PushButton: View {
//        let title: String
//        @Binding var isOn: Bool
//
//        var onColors = [Color.red, Color.yellow]
//        var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//        var body: some View {
//            Button(title) {
//                isOn.toggle()
//            }
//            .padding()
//            .background(
//                LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors),
//                               startPoint: .top,
//                               endPoint: .bottom))
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .shadow(radius: isOn ? 0 : 5)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
