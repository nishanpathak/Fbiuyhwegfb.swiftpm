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
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13", "Item 14", "Item 15", "Item 16", "Item 17", "Item 18", "Item 19", "Item 20"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        // Navigate to a new view or perform some action
                        navigateToDetailView(item: item)
                    }) {
                        Text(item)
                    }
                }
            }
            .navigationTitle("Items List")
        }
    }

    func navigateToDetailView(item: String) {
        NavigationLink(
            destination: DetailView(item: item),
            label: {
                EmptyView()
            }
        )
    }

struct DetailView: View {
    let item: String

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


