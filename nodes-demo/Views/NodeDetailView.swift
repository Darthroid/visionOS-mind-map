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
    
    @State var showEditor: Bool = false
    
    var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(node.detail)
            
            HStack {
                Text("Position:")
                    .fontWeight(.semibold)
                Text(node.positionDescriptionMeters)
            }
            .font(.caption)
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    showDeleteConfirmation.toggle()
                } label: {
                    Text("Delete")
                }
                
                Button {
                    showEditor.toggle()
                } label: {
                    Text("Edit")
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
        .sheet(isPresented: $showEditor) {
            EditNodeView(node: node)
        }
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
