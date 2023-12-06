import SwiftUI

struct PremierLeagueTeams: View {
    let premierLeagueTeams = [
        "Arsenal", "Aston Villa", "A.C.F Bournemouth" , "Brentford", "Brighton & Hove Albion", "Burnley",
        "Chelsea", "Crystal Palace", "Everton", "Fulham", "Luton Town",
        "Liverpool", "Manchester City", "Manchester United", "Newcastle United", "Nottingham Forest", "Sheffield United",
        "Southampton", "Tottenham Hotspur", "West Ham United", "Wolverhampton Wanderers"
    ]

    var body: some View {
        NavigationView {
            List(premierLeagueTeams, id: \.self) { team in
                Text(team)
            }
            .navigationBarTitle("Premier League Teams", displayMode: .inline)
        }
    }
}

struct PremierLeagueTeams_Previews: PreviewProvider {
    static var previews: some View {
        PremierLeagueTeams()
    }
}
struct TeamStanding: Identifiable {
    let id: Int
    let name: String
    let position: Int
    let wins: Int
    let draws: Int
    let losses: Int
    let goalDifference: Int
    let points: Int
}

struct PremierLeagueTeam: View {
    let standings: [TeamStanding] = [
        TeamStanding(id: 1, name: "Team A", position: 1, wins: 10, draws: 5, losses: 3, goalDifference: 15, points: 35),
        TeamStanding(id: 2, name: "Team B", position: 2, wins: 9, draws: 6, losses: 3, goalDifference: 12, points: 33),
    ]

    var body: some View {
        NavigationView {
            List(standings) { team in
                NavigationLink(destination: TeamDetailView(team: team)) {
                    TeamStandingRow(team: team)
                }
            }
            .navigationBarTitle("Premier League Standings 2023/2024")
        }
    }
}

struct TeamStandingRow: View {
    let team: TeamStanding

    var body: some View {
        HStack {
            Text("\(team.position)")
                .frame(width: 20)
            Text(team.name)
                .fontWeight(.bold)
            Spacer()
            Text("W: \(team.wins)  D: \(team.draws)  L: \(team.losses)")
                .foregroundColor(.gray)
            Spacer()
            Text("GD: \(team.goalDifference)")
                .foregroundColor(.blue)
            Spacer()
            Text("Pts: \(team.points)")
                .foregroundColor(.green)
        }
        .padding(10)
    }
}

struct TeamDetailView: View {
    let team: TeamStanding

    var body: some View {
        VStack {
            Text("\(team.name) Details")
                .font(.title)
                .padding()

            Text("Wins: \(team.wins)")
            Text("Draws: \(team.draws)")
            Text("Losses: \(team.losses)")
            Text("Goal Difference: \(team.goalDifference)")
            Text("Points: \(team.points)")

            Spacer()
        }
        .navigationBarTitle("\(team.name)")
    }
}

struct premierLeagueTeam: PreviewProvider {
    static var previews: some View {
        PremierLeagueTeam()
    }
}
