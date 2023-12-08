import SwiftUI

struct PremierLeagueTeams: View {
    let premierLeagueTeams = [
        "Arsenal", "Aston Villa", "Bournemouth" , "Brentford", "Brighton", "Burnley",
        "Chelsea", "Crystal Palace", "Everton", "Fulham", "Luton Town",
        "Liverpool", "Manchester City", "Manchester United", "Newcastle", "Nottingham Forest", "Sheffield United",
         "Tottenham", "West Ham United", "Wolves"
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
        TeamStanding(id: 1, name: "Arsenal", position: 1, wins: 11, draws: 3, losses: 1, goalDifference: 19, points: 36),
        TeamStanding(id: 2, name: "Liverpool", position: 2, wins: 9, draws: 4, losses: 1, goalDifference: 18, points: 31),
        TeamStanding(id: 3, name: "Manchester City", position: 3, wins: 9, draws: 3, losses: 2, goalDifference: 20, points: 30),
        TeamStanding(id: 4, name: "Aston Villa", position: 4, wins: 9, draws: 2, losses: 3, goalDifference: 13, points: 29),
        TeamStanding(id: 5, name: "Tottenham", position: 5, wins: 8, draws: 3, losses: 3, goalDifference: 8, points: 27),
        TeamStanding(id: 6, name: "Newcastle", position: 6, wins: 8, draws: 2, losses: 4, goalDifference: 18, points: 26),
        TeamStanding(id: 7, name: "Manchester United", position: 7, wins: 0, draws: 0, losses: 6, goalDifference: -1, points: 26),
        TeamStanding(id: 8, name: "Brighton", position: 8, wins: 6, draws: 4, losses: 4, goalDifference: 4, points: 22),
        TeamStanding(id: 9, name: "West Ham", position: 9, wins: 6, draws: 3, losses: 5, goalDifference: 0, points: 21),
        TeamStanding(id: 10, name: "Chelsea", position: 10, wins: 5, draws: 4, losses: 5, goalDifference: 3, points: 19),
        TeamStanding(id: 11, name: "Brentford", position: 11, wins: 5, draws: 4, losses: 5, goalDifference: 3, points: 19),
        TeamStanding(id: 12, name: "Wolves", position: 12, wins: 5, draws: 3, losses: 7, goalDifference: -5, points: 18),
        TeamStanding(id: 13, name: "Crystal Palace", position: 13, wins: 4, draws: 4, losses: 6, goalDifference:-5, points: 16),
        TeamStanding(id: 14, name: "Fulham", position: 14, wins: 4, draws: 3, losses: 7, goalDifference: -10, points: 15),
        TeamStanding(id: 15, name: "Nottingham Forest", position: 15, wins: 3, draws: 4, losses: 7, goalDifference:-6, points: 13),
        TeamStanding(id: 16, name: "Bournemouth", position: 16, wins: 3, draws: 4, losses: 7, goalDifference: -14, points: 13),
        TeamStanding(id: 17, name: "Luton Town", position: 17, wins: 2, draws: 3, losses: 10, goalDifference: -14, points: 9),
        TeamStanding(id: 18, name: "Everton", position: 18, wins: 5, draws: 2, losses: 7, goalDifference: -5, points: 7),
        TeamStanding(id: 19, name: "Burnley", position: 19, wins: 2, draws: 1, losses: 12, goalDifference: -18, points: 7),
        TeamStanding(id: 20, name: "Sheffield United", position: 20, wins: 1, draws: 2, losses: 11, goalDifference: -28, points: 5)
    
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
