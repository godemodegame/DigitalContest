import Foundation
import Alamofire

class NetworkService {
    private let url = "http://172.20.10.3:8000"
    
    public func signIn(password: String, login: String, completion: @escaping (LoginResponse?) -> Void) {
        print("password: \(password), login: \(login)")
        completion(LoginResponse(isSuccess: true))
    }
    
    public func fetchPipes(completion: @escaping ([Pipe]?) -> Void) {
        let fullUrl = url + "/api/piping/"
        Alamofire.request(fullUrl).response { dataResponse in
            if let error = dataResponse.error {
                print("Error received requesting data: \(error.localizedDescription)")
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode([Pipe].self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON: ", jsonError)
                completion(nil)
            }
        }
        
        let fakePipes = [
        Pipe(id: 0,
             name: "№321",
             length: 11.1,
             defects: [PipeDamage(defect_type: "Язва",
                                  distance: 3.0),
                       PipeDamage(defect_type: "Риска",
                                  distance: 4.0),
                       PipeDamage(defect_type: "Язва",
                                  distance: 4.0),
                       PipeDamage(defect_type: "Язва",
                                  distance: 7),
                       PipeDamage(defect_type: "Питтинг",
                                  distance: 4.0),
                       PipeDamage(defect_type: "Потеря металла на сварном шве",
                                  distance: 6.0),
                       PipeDamage(defect_type: "Канавка",
                                  distance: 9.0),
                       PipeDamage(defect_type: "Язва",
                                  distance: 13.0),
                       PipeDamage(defect_type: "Риска",
                                  distance: 15.0)]),
             Pipe(id: 1,
                  name: "№899",
                  length: 31.3,
                  defects: [PipeDamage(defect_type: "Питтинг",
                                       distance: 4.0),
                            PipeDamage(defect_type: "Потеря металла на сварном шве",
                                       distance: 6.0),
                            PipeDamage(defect_type: "Канавка",
                                       distance: 9.0),
                            PipeDamage(defect_type: "Язва",
                                       distance: 13.0),
                            PipeDamage(defect_type: "Риска",
                                       distance: 15.0)])]
        completion(fakePipes)
    }
}
