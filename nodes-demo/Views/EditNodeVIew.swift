//
//  EditNodeVIew.swift
//  nodes-demo
//
//  Created by Олег Комаристый on 04.12.2025.
//


import SwiftUI

struct EditNodeView: View {
    @Environment(AppModel.self) var appModel
    @Environment(\.dismiss) var dismiss

    @State var node: Node
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    TextField(text: $node.name) {
                        Text("Name")
                    }
                    
                    TextField(text: $node.detail) {
                        Text("Description")
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Button("Save") {
                        appModel.updateNode(id: node.id, with: node)
                        dismiss()
                    }
                    .disabled(node.name.isEmpty && node.detail.isEmpty)
                }
            }
            .padding()
            .navigationTitle(Text("Edit \(node.name)"))
        }
    }
}
