//
//  LinkEditorView.swift
//  nodes-demo
//
//  Created by Олег Комаристый on 07.12.2025.
//

import SwiftUI

struct LinkEditorView: View {
    @Environment(AppModel.self) var appModel
    @Environment(\.dismiss) var dismiss

    @State var fromNode: Node
    
    @State var selectedNodeId: String?
    
    var body: some View {
        NavigationStack {
            List(selection: $selectedNodeId) {
                ForEach(appModel.nodes.filter { $0.id != fromNode.id }) { node in
                    VStack(alignment: .leading) {
                        Text(node.name)
                            .font(.headline)
                        Text(node.positionDescription)
                            .font(.footnote)
                    }
                }
            }
            .padding()
            .navigationTitle(Text("Add Link To \(fromNode.name)"))
        }
        .onChange(of: selectedNodeId) { oldValue, newValue in
            guard let toNodeId = newValue else { return }
            appModel.addConnection(from: fromNode.id, to: toNodeId)
            dismiss()
        }
    }
}
