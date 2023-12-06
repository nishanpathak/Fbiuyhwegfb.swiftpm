import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
               Image("PL")
                
                
        NavigationLink(destination: PremierLeagueTeams()) {
                Text("Premier League Teams")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

