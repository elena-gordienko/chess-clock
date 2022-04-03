//
//  View+isHidden.swift
//  ChessClock
//
//  Created by Elena Gordienko on 03.04.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, shouldBeRemoved: Bool = false) -> some View {
        if hidden {
            if !shouldBeRemoved { self.hidden() }
        } else {
            self
        }
    }
}
