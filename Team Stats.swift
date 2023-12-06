import Foundation
import SwiftUI


struct TeamStatsView: View {
    var team: Team

    var body: some View {
        VStack {
            Text("\(team.name) Statistics")
                .font(.headline)
                .padding()

          
        }
    }
}

struct Team: Codable, Identifiable {
    var id: Int
    var name: String


}

struct StandingResponse: Codable {
    var standings: [Standing]
}

struct Standing: Codable {
    var table: [Team]
}

struct TeamStatsResponse: Codable {
   
}
