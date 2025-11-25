//
//  NodeDetailView.swift
//  nodes-demo
//
//  Created by Олег Комаристый on 18.11.2025.
//

import SwiftUI

struct NodeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AppModel.self) var appModel
    
    @State var showDeleteConfirmation: Bool = false
    
    var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(node.detail)
            
            HStack {
                Text("Position:")
                    .fontWeight(.semibold)
                Text(node.positionDescription)
            }
            .font(.caption)
            
            Spacer()
            
            HStack {
                Button {
                    showDeleteConfirmation.toggle()
                } label: {
                    Text("Delete")
                }
            }
        }
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("Done")
            }
        }
        .navigationTitle(node.name)
        .alert(
            Text("Delete node"),
            isPresented: $showDeleteConfirmation,
            actions: {
                Button(role: .destructive) {
                    showDeleteConfirmation.toggle()
                    dismiss()
                    appModel.removeNode(node)
                } label: {
                    Text("Delete")
                }
                Button(role: .cancel) {
                    //
                } label: {
                    Text("Cancel")
                }

            },
            message: {
                Text("Are you sure you want to delete this node?")
            })
        
        .padding()
    }
}

#Preview {
    NodeDetailView(node: .init(id: UUID().uuidString, name: "Test", detail: "Description", x: 0, y: 0, z: 0))
}
