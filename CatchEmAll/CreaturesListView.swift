//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Richard Gagg on 7/3/2025.
//

import SwiftUI

struct CreaturesListView: View {
  @State var creatures = Cretrures()
  
  
  var body: some View {
    NavigationStack {
      List(creatures.creaturesArray, id: \.self) { creature in
        Text(creature.name)
                .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
      
    }
    .task {
      await creatures.getData()
    }
  }
}



#Preview {
  CreaturesListView()
}
