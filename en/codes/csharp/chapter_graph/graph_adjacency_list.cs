/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Undirected graph class implemented with an adjacency list */
public class GraphAdjList {
    // Adjacency list: key is a vertex, value is the list of all its neighbors
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* Constructor */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // Add all vertices and edges
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    int Size() {
        return adjList.Count;
    }

    /* Add an edge */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Add edge vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* Remove an edge */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Remove edge vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* Add a vertex */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // Add a new list to the adjacency list
        adjList.Add(vet, []);
    }

    /* Remove a vertex */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // Remove the list corresponding to vertex vet from the adjacency list
        adjList.Remove(vet);
        // Traverse the lists of the other vertices and remove all edges incident to vet
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* Print the adjacency list */
    public void Print() {
        Console.WriteLine("Adjacency list =");
        foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
            List<int> tmp = [];
            foreach (Vertex vertex in pair.Value)
                tmp.Add(vertex.val);
            Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
        }
    }
}

public class graph_adjacency_list {
    [Test]
    public void Test() {
        /* Initialize the undirected graph */
        Vertex[] v = Vertex.ValsToVets([1, 3, 2, 5, 4]);
        Vertex[][] edges =
        [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[3]],
            [v[2], v[4]],
            [v[3], v[4]] 
        ];
        GraphAdjList graph = new(edges);
        Console.WriteLine("\nGraph after initialization:");
        graph.Print();

        /* Add an edge */
        // Vertices 1 and 2 are v[0] and v[2]
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\nGraph after adding edge 1-2:");
        graph.Print();

        /* Remove an edge */
        // Vertices 1 and 3 are v[0] and v[1]
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\nGraph after removing edge 1-3:");
        graph.Print();

        /* Add a vertex */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\nGraph after adding vertex 6:");
        graph.Print();

        /* Remove a vertex */
        // Vertex 3 is v[1]
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\nGraph after removing vertex 3:");
        graph.Print();
    }
}
