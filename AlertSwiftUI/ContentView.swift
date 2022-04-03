//
//  ContentView.swift
//  AlertSwiftUI
//
//  Created by Danil Peregorodiev on 03.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func alertTF(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primatyAction: @escaping (String)->(), secondaryAction: @escaping ()->()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .cancel, handler: { _ in
            if let text = alert.textFields?[0].text {
                primatyAction(text)
            }
            else {
                primaryAction()
            }
        }))
    }
}
