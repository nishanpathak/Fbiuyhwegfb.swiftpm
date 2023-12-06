//
//  Premier League Standings.swift
//  Fbiuyhwegfb
//
//  Created by Adrian Jurczenia on 12/4/23.
//

import SwiftUI

struct PremierLeagueTeams: View {
    let premierLeagueTeams = [
        "Arsenal", "Aston Villa", "Brentford", "Brighton & Hove Albion", "Burnley",
        "Chelsea", "Crystal Palace", "Everton", "Leeds United", "Leicester City",
        "Liverpool", "Manchester City", "Manchester United", "Newcastle United", "Norwich City",
        "Southampton", "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers"
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
