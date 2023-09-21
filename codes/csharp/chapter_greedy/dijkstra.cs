using System;

class dijkstra
{
    private static readonly int V = 6;

    private int MinDistance(int[] dist, bool[] sptSet)
    {
        int minDist = int.MaxValue;
        int minIndex = -1;

        for (int v = 0; v < V; v++)
        {
            if (!sptSet[v] && dist[v] <= minDist)
            {
                minDist = dist[v];
                minIndex = v;
            }
        }

        return minIndex;
    }

    private void PrintSolution(int[] dist)
    {
        Console.WriteLine("顶点   距离");
        for (int i = 0; i < V; i++)
        {
            Console.WriteLine($"{i}     {dist[i]}");
        }
    }

    public void Dijkstra(int[,] graph, int src)
    {
        int[] dist = new int[V];
        bool[] sptSet = new bool[V];

        for (int i = 0; i < V; i++)
        {
            dist[i] = int.MaxValue;
            sptSet[i] = false;
        }

        dist[src] = 0;

        for (int count = 0; count < V - 1; count++)
        {
            int u = MinDistance(dist, sptSet);
            sptSet[u] = true;

            for (int v = 0; v < V; v++)
            {
                if (!sptSet[v] && graph[u, v] != 0 && dist[u] != int.MaxValue &&
                    dist[u] + graph[u, v] < dist[v])
                {
                    dist[v] = dist[u] + graph[u, v];
                }
            }
        }

        PrintSolution(dist);
    }

    static void Main()
    {
        int[,] graph = {
            {0, 2, 0, 6, 0, 0},
            {2, 0, 3, 8, 5, 0},
            {0, 3, 0, 0, 7, 0},
            {6, 8, 0, 0, 9, 10},
            {0, 5, 7, 9, 0, 1},
            {0, 0, 0, 10, 1, 0}
        };

        dijkstra dijkstra = new dijkstra();
        dijkstra.Dijkstra(graph, 0);
    }
}
