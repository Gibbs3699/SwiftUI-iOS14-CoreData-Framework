//
//  ContentView.swift
//  ToDo-App&Widget
//
//  Created by admin on 7/1/2565 BE.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - PROPERTY
    @State var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    //MARK: - FETCHING DATA
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    //MARK: - FUNCTION
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
   
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16){
                    TextField("New Task", text: $task)
                        .padding()
                        .background(
                            Color(UIColor.systemGray6)
                        )
                        .cornerRadius(10)
                    
                    Button(action: addItem, label: {
                        Spacer()
                        Text("SAVE")
                        Spacer()
                    })
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                .padding()
                List {
                    ForEach(items) { item in
                            // if items.task equal to nil return ""
                            VStack(alignment: .leading) {
                                Text(item.task ?? "")
                                    .font(.headline)
                                .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    .onDelete(perform: deleteItems)
                }//: LIST
            } //: VSTACK
            .navigationBarTitle("Daily Task", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
