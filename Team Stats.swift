import Foundation

let headers = [
    "X-RapidAPI-Key": "199b6f4b67msh57c679495124fccp15a497jsn324da79e9baa",
    "X-RapidAPI-Host": "api-football-beta.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-beta.p.rapidapi.com/teams/statistics?team=33&season=2019&league=39")! as URL,
                                  cachePolicy: .useProtocolCachePolicy,
                                  timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if let error = error {
        print("Error: \(error)")
    } else {
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")

            if let data = data {
                // Handle the response data here
                print("Response Data: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
    }
})

dataTask.resume()
