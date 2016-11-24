//
//  UIImage+Extras.swift
//  SentrySwift
//
//  Created by Daniel Griesser on 24/11/2016.
//
//

import Foundation
import UIKit

extension UIImage {
    
    public class func imageFromBundle(named name: String, in bundle: Bundle?) -> UIImage? {
        if #available(iOS 8.0, *) {
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        } else {
            guard let contents = bundle?.path(forResource: name, ofType: "png") else {
                return nil
            }
            return UIImage(contentsOfFile: contents)
        }
    }
    
}
