class Edge {
    destination: number;
    weight: number;
  
    constructor(destination: number, weight: number) {
      this.destination = destination;
      this.weight = weight;
    }
  }
  
  class dijkstra {
    numVertices: number;
    graph: Array<Array<Edge>>;
  
    constructor(numVertices: number, graph: Array<Array<Edge>>) {
      this.numVertices = numVertices;
      this.graph = graph;
    }
  
    dijkstra(source: number): Array<number> {
      const dist: Array<number> = new Array(this.numVertices).fill(Number.MAX_SAFE_INTEGER);
      const visited: Array<boolean> = new Array(this.numVertices).fill(false);
  
      dist[source] = 0;
  
      for (let i = 0; i < this.numVertices - 1; i++) {
        const minDistVertex: number = this.getMinDistance(dist, visited);
  
        visited[minDistVertex] = true;
  
        for (const edge of this.graph[minDistVertex]) {
          const v: number = edge.destination;
          const weight: number = edge.weight;
  
          if (!visited[v] && dist[minDistVertex] !== Number.MAX_SAFE_INTEGER && dist[minDistVertex] + weight < dist[v]) {
            dist[v] = dist[minDistVertex] + weight;
          }
        }
      }
  
      return dist;
    }
  
    getMinDistance(dist: Array<number>, visited: Array<boolean>): number {
      let minDist: number = Number.MAX_SAFE_INTEGER;
      let minDistVertex: number = -1;
  
      for (let v = 0; v < this.numVertices; v++) {
        if (!visited[v] && dist[v] <= minDist) {
          minDist = dist[v];
          minDistVertex = v;
        }
      }
  
      return minDistVertex;
    }
  }
  
  const graph: Array<Array<Edge>> = [
    [new Edge(1, 2), new Edge(3, 6)],
    [new Edge(0, 2), new Edge(2, 3), new Edge(3, 8), new Edge(4, 5)],
    [new Edge(1, 3), new Edge(4, 7)],
    [new Edge(0, 6), new Edge(1, 8), new Edge(4, 9), new Edge(5, 10)],
    [new Edge(1, 5), new Edge(2, 7), new Edge(3, 9), new Edge(5, 1)],
    [new Edge(3, 10), new Edge(4, 1)],
  ];
  
  const dijkstra_ = new dijkstra(graph.length, graph);
  const dist = dijkstra_.dijkstra(0);
  
  console.log("顶点   距离");
  for (let i = 0; i < dist.length; i++) {
    console.log(`${i}     ${dist[i]}`);
  }
  