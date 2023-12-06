//
//  Top Scorers.swift
//  Fbiuyhwegfb
//
//  Created by Adrian Jurczenia on 12/6/23.
//

import SwiftUI

class TopScorersViewModel: ObservableObject {
    @Published var topScorers: [TopScorer] = []

    func fetchTopScorers() {
        let headers = [
            "X-RapidAPI-Key": "199b6f4b67msh57c679495124fccp15a497jsn324da79e9baa",
            "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
        ]

        guard let url = URL(string: "https://api-football-v1.p.rapidapi.com/v3/players/topscorers?league=39&season=2020") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let topScorersResponse = try JSONDecoder().decode(TopScorersResponse.self, from: data)
                DispatchQueue.main.async {
                    self.topScorers = topScorersResponse.response
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct TopScorers: View {
    @StateObject private var viewModel = TopScorersViewModel()

    var body: some View {
        VStack {
            Text("Top Scorers")
                .font(.title)

            List(viewModel.topScorers, id: \.player.id) { topScorer in
                Text("\(topScorer.player.firstName) \(topScorer.player.lastName)")
            }
        }
        .onAppear {
            viewModel.fetchTopScorers()
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


