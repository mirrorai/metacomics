import UIKit

class ImageService {
    
    func loadImage(with url: URL, completion: @escaping (UIImage?, UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data), nil)
            }
        }
        
        task.resume()
    }
    
}

