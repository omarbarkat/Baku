import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager

    var body: some View {
        HStack {
            VStack {
                Button {
                    workoutManager.endWorkout()
                    print("end session")
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
            }
            VStack {
                Button {
                    workoutManager.togglePause()  // استخدم الدالة togglePause للتبديل بين الإيقاف المؤقت والاستئناف
                    print(workoutManager.running ? "paused" : "resumed")
                } label: {
                    Image(systemName: workoutManager.running ? "pause" : "play")
                }
                .tint(.blue)  // يمكنك تغيير اللون كما تراه مناسبًا
                .font(.title2)
                Text(workoutManager.running ? "Pause" : "Resume")
            }
        }
        .padding()  // إضافة padding لجعل الواجهة تبدو أفضل
    }
}

// MARK: - Preview
struct ControlsView_Previews: PreviewProvider {
    static var manager: WorkoutManager = {
        let man = WorkoutManager()
        return man
    }()
    
    static var previews: some View {
        NavigationStack {
            ControlsView()
                .environmentObject(manager)
                .onAppear {
                    manager.startWorkout(workoutType: .running)
                }
        }
    }
}

