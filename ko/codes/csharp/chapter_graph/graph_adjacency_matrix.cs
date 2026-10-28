/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
    List<int> vertices;     // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    List<List<int>> adjMat; // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

    /* 생성자 */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // 정점 추가
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* 정점 개수 반환 */
    int Size() {
        return vertices.Count;
    }

    /* 정점 추가 */
    public void AddVertex(int val) {
        int n = Size();
        // 정점 리스트에 새 정점의 값을 추가한다
        vertices.Add(val);
        // 인접 행렬에 행 하나를 추가한다
        List<int> newRow = new(n);
        for (int j = 0; j < n; j++) {
            newRow.Add(0);
        }
        adjMat.Add(newRow);
        // 인접 행렬에 열 하나를 추가한다
        foreach (List<int> row in adjMat) {
            row.Add(0);
        }
    }

    /* 정점 삭제 */
    public void RemoveVertex(int index) {
        if (index >= Size())
            throw new IndexOutOfRangeException();
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        vertices.RemoveAt(index);
        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        adjMat.RemoveAt(index);
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    public void AddEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    public void RemoveEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 인접 행렬 출력 */
    public void Print() {
        Console.Write("정점 리스트 = ");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("인접 행렬 =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 무방향 그래프 초기화 */
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        int[] vertices = [1, 3, 2, 5, 4];
        int[][] edges = 
        [
            [0, 1],
            [0, 3],
            [1, 2],
            [2, 3],
            [2, 4],
            [3, 4]
        ];
        GraphAdjMat graph = new(vertices, edges);
        Console.WriteLine("\n초기화한 후의 그래프");
        graph.Print();

        /* 간선 추가 */
        // 정점 1, 2의 인덱스는 각각 0, 2이다
        graph.AddEdge(0, 2);
        Console.WriteLine("\n간선 1-2를 추가한 후의 그래프");
        graph.Print();

        /* 간선 삭제 */
        // 정점 1, 3의 인덱스는 각각 0, 1이다
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\n간선 1-3을 삭제한 후의 그래프");
        graph.Print();

        /* 정점 추가 */
        graph.AddVertex(6);
        Console.WriteLine("\n정점 6을 추가한 후의 그래프");
        graph.Print();

        /* 정점 삭제 */
        // 정점 3의 인덱스는 1이다
        graph.RemoveVertex(1);
        Console.WriteLine("\n정점 3을 삭제한 후의 그래프");
        graph.Print();
    }
}
