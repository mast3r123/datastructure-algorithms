import UIKit

class Graph {
    
    var numberOfNodes = 0
    var adjacentList = [Int: [Int]]()
    
    init() {
        
    }
    
    func addVertex(node: Int) {
        adjacentList[node] = []
        numberOfNodes += 1
    }
    
    func addEdge(nodeOne: Int, nodeTwo: Int) {
        adjacentList[nodeOne]?.append(nodeTwo)
        adjacentList[nodeTwo]?.append(nodeOne)
    }
    
    func showConnections() {
        let keys = adjacentList.keys
        for key in keys {
            let connections = adjacentList[key]
            var connection = ""
            for vertex in connections! {
                connection.append(String(vertex) + " ")
            }
            print(String(key) + "-->" + connection)
        }
    }
}

let graph = Graph()
graph.addVertex(node: 3)
graph.addVertex(node: 1)
graph.addVertex(node: 2)
graph.addEdge(nodeOne: 3, nodeTwo: 1)
graph.showConnections()
