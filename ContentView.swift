import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("PL")
                
                VStack {
                    NavigationLink(destination: PremierLeagueTeams()) {
                        Text("Premier League Teams")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    NavigationLink(destination: TopAssistsView()) {
                        Text("Top Assists")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    NavigationLink(destination: TopScorers()) {
                        Text("Top Scorers")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    NavigationLink(destination: TeamStats()) {
                        Text("Team Stats")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .navigationBarTitle("Premier League", displayMode: .inline)
            }
        }
    }
}

