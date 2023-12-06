
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var teams: [Team] = []
    @State private var selectedTeam: Team? = nil

    var body: some View {
        VStack {
            Text("Premier League Standing")
                .font(.title)

            List(teams, id: \.id) { team in
                Button(action: {
                    self.selectedTeam = team
                    self.fetchTeamStats(teamID: team.id)
                }) {
                    Text(team.name)
                }
            }

            if let selectedTeam = selectedTeam {
                TeamStatsView(team: selectedTeam)
            }
        }
        .onAppear {
            self.fetchPremierLeagueStanding()
        }
    }

    func fetchPremierLeagueStanding() {
        // Replace 'YOUR_API_KEY' with your actual API key from https://www.football-data.org/
        let apiKey = "YOUR_API_KEY"
        let apiUrl = "https://api.football-data.org/v2/competitions/PL/standings"

        guard let url = URL(string: apiUrl) else { return }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let standings = try JSONDecoder().decode(StandingResponse.self, from: data)
                self.teams = standings.standings[0].table
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }

    func fetchTeamStats(teamID: Int) {
        // Replace 'YOUR_API_KEY' with your actual API key from https://www.football-data.org/
        let apiKey = "YOUR_API_KEY"
        let apiUrl = "https://api.football-data.org/v2/teams/\(teamID)/players"

        guard let url = URL(string: apiUrl) else { return }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let teamStats = try JSONDecoder().decode(TeamStatsResponse.self, from: data)
                print(teamStats)
                // Handle the team stats data as needed
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TeamStatsView: View {
    var team: Team

    var body: some View {
        VStack {
            Text("\(team.name) Statistics")
                .font(.headline)
                .padding()

            // Display team statistics here based on the fetched data
        }
    }
}

struct Team: Codable, Identifiable {
    var id: Int
    var name: String

    // Add any other properties you need from the API response
}

struct StandingResponse: Codable {
    var standings: [Standing]
}

struct Standing: Codable {
    var table: [Team]
}

struct TeamStatsResponse: Codable {
    // Add properties based on the team stats API response
}
