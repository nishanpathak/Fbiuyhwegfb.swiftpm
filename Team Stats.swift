import SwiftUI

struct TeamStats: View {
    @State private var statusCode: Int?
    @State private var responseData: String?

    var body: some View {
        VStack {
            if let statusCode = statusCode {
                Text("Status Code: \(statusCode)")
            }

            if let responseData = responseData {
                Text("Response Data: \(responseData)")
                    .padding()
            }
        }
        .onAppear {
            fetchData()
        }
    }

    func fetchData() {
        let headers = [
            "X-RapidAPI-Key": "199b6f4b67msh57c679495124fccp15a497jsn324da79e9baa",
            "X-RapidAPI-Host": "api-football-beta.p.rapidapi.com"
        ]

        let url = URL(string: "https://api-football-beta.p.rapidapi.com/teams/statistics?team=33&season=2019&league=39")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                } else {
                    if let httpResponse = response as? HTTPURLResponse {
                        self.statusCode = httpResponse.statusCode

                        if let data = data {
                            self.responseData = String(data: data, encoding: .utf8)
                        }
                    }
                }
            }
        }

        dataTask.resume()
    }
}
