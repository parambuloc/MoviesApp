//
//  ImageViewExtension.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from url: URL?, placeholder: UIImage? = nil) {
        if let placeholderImage = placeholder {
            self.image = placeholderImage
        }
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error al descargar la imagen: \(error.localizedDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("Error de respuesta HTTP: \(httpResponse.statusCode)")
                    return
                }
                
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }.resume()
        }
    }
}
