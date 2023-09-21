class dijkstra {
    constructor() {
      this.V = 6;
    }
  
    minDistance(dist, sptSet) {
      let minDist = Infinity;
      let minIndex = -1;
  
      for (let v = 0; v < this.V; v++) {
        if (!sptSet[v] && dist[v] <= minDist) {
          minDist = dist[v];
          minIndex = v;
        }
      }
  
      return minIndex;
    }
  
    printSolution(dist) {
      console.log("顶点   距离");
      for (let i = 0; i < this.V; i++) {
        console.log(i + "     " + dist[i]);
      }
    }
  
    dijkstra(graph, src) {
      let dist = new Array(this.V).fill(Infinity);
      let sptSet = new Array(this.V).fill(false);
  
      dist[src] = 0;
  
      for (let count = 0; count < this.V - 1; count++) {
        let u = this.minDistance(dist, sptSet);
        sptSet[u] = true;
  
        for (let v = 0; v < this.V; v++) {
          if (
            !sptSet[v] &&
            graph[u][v] !== 0 &&
            dist[u] !== Infinity &&
            dist[u] + graph[u][v] < dist[v]
          ) {
            dist[v] = dist[u] + graph[u][v];
          }
        }
      }
  
      this.printSolution(dist);
    }
  }
  
  let graph = [
    [0, 2, 0, 6, 0, 0],
    [2, 0, 3, 8, 5, 0],
    [0, 3, 0, 0, 7, 0],
    [6, 8, 0, 0, 9, 10],
    [0, 5, 7, 9, 0, 1],
    [0, 0, 0, 10, 1, 0],
  ];
  
  let dijkstra = new dijkstra();
  dijkstra.dijkstra(graph, 0);
  