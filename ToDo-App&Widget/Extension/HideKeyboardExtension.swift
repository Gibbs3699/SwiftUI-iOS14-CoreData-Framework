//
//  HideKeyboardExtension.swift
//  ToDo-App&Widget
//
//  Created by admin on 9/1/2565 BE.
//

import SwiftUI

#if canImport(UIKit)
func hideKeyboard(){
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
#endif
