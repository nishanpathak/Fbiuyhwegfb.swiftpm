//
//  Top Assists.swift
//  Fbiuyhwegfb
//
//  Created by Adrian Jurczenia on 12/6/23.
//

import SwiftUI

struct TopAssists: Codable {
    let response: [TopAssist]
}

struct TopAssist: Codable {
    let player: Player
    let id: Int
    let firstName: String
    let lastName: String
}

class TopAssistsViewModel: ObservableObject {
    @Published var topAssists: [TopAssist] = []

    func fetchTopAssists() {
        
    }
}

struct TopAssistsView: View {
    @StateObject private var viewModel = TopAssistsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Top Assists")
                    .font(.title)

                List(viewModel.topAssists, id: \.player.id) { topAssist in
                    Text("\(topAssist.player.firstName) \(topAssist.player.lastName)")
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
        }
    }
}

struct TopAssistsView_Previews: PreviewProvider {
    static var previews: some View {
        TopAssistsView()
    }
}


