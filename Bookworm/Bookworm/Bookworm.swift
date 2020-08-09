//
//  Bookworm.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct Bookworm {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>


    @State private var showingAddScreen = false
}

extension Bookworm {
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context
        try? moc.save()
    }
}

extension Bookworm: View {
    var body: some View {
        List {
            ForEach(books, id: \.self) { book in
                NavigationLink(destination: DetailView(book: book)) {
                    EmojiRatingView(rating: book.rating)
                        .font(.largeTitle)

                    VStack(alignment: .leading) {
                        Text(book.title ?? "Unknown Title")
                            .font(.headline)
                            .foregroundColor(book.rating == 1 ? .red : .black)
                        Text(book.author ?? "Unknown Author")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteBooks)

        }
        .navigationBarTitle("Bookworm")
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            self.showingAddScreen.toggle()
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddScreen) {
            AddBookView().environment(\.managedObjectContext, self.moc)
        }
    }
}

struct Bookworm_Previews: PreviewProvider {
    static var previews: some View {
        Bookworm()
    }
}
