//
//  SafeImage.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-28.
//

import SwiftUI

extension Image {
    init(safe name: String, placeholder: String = "image_1") {
        if UIImage(named: name) != nil {
            self.init(name)
        } else {
            self.init(placeholder)
        }
    }
}
