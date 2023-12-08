import SwiftUI

class TopScorersViewModel: ObservableObject {
    @Published var topScorers: [TopScorer] = []

    func fetchTopScorers() {
       
    }
}

struct TopScorers: View {
    @StateObject private var viewModel = TopScorersViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Top Scorers")
                    .font(.title)

                List(viewModel.topScorers, id: \.player.id) { topScorer in
                    Text("\(topScorer.player.firstName) \(topScorer.player.lastName)")
                }

                
                NavigationLink(destination: ContentView()) {
                    Text("Go to ContentView")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .onAppear {
                viewModel.fetchTopScorers()
            }
        }
    }
}

struct TopScorersResponse: Codable {
    let response: [TopScorer]
}

struct TopScorer: Codable {
    let player: Player
}

struct Player: Codable {
    let id: Int
    let firstName: String
    let lastName: String
}


