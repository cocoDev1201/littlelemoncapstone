//
//  Menu.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State private var menuItems = [MenuItem]()
    
    var body: some View {
        VStack {
            Text("Little Lemon Bistro")
            Text("Chicago")
            Text("We are best bistro in the town.")
            List {
                // menu items
            }
            
        }
        .task {
           await getMenuData()
        }
    }
    
    func getMenuData() async {
        
        // create Url
        
            let serverUrlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
            guard let url = URL(string: serverUrlString) else { return }
        
            let urlRequest = URLRequest(url: url)
        
        // fetch data from the url
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([menuItems].self, from: data) {
                MenuItem = decodedResponse
            }
        } catch {
            print("fdlkfs")
        }
     
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

