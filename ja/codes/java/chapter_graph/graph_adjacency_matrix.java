/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* 隣接行列で実装した無向グラフクラス */
class GraphAdjMat {
    List<Integer> vertices; // 頂点リスト。要素は「頂点の値」、インデックスは「頂点のインデックス」を表す
    List<List<Integer>> adjMat; // 隣接行列。行と列のインデックスは「頂点のインデックス」に対応する

    /* コンストラクタ */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 頂点を追加する
        for (int val : vertices) {
            addVertex(val);
        }
        // 辺を追加する
        // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 頂点数を取得する */
    public int size() {
        return vertices.size();
    }

    /* 頂点を追加する */
    public void addVertex(int val) {
        int n = size();
        // 頂点リストに新しい頂点の値を追加する
        vertices.add(val);
        // 隣接行列に 1 行追加する
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 隣接行列に 1 列追加する
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 頂点を削除する */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 頂点リストからインデックス index の頂点を削除する
        vertices.remove(index);
        // 隣接行列からインデックス index の行を削除する
        adjMat.remove(index);
        // 隣接行列からインデックス index の列を削除する
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 辺を追加する */
    // 引数 i, j は vertices の要素のインデックスに対応する
    public void addEdge(int i, int j) {
        // 添字が範囲外または互いに等しい場合の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 無向グラフの隣接行列は主対角線に関して対称であり、(i, j) == (j, i) を満たす
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 辺を削除する */
    // 引数 i, j は vertices の要素のインデックスに対応する
    public void removeEdge(int i, int j) {
        // 添字が範囲外または互いに等しい場合の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 隣接行列を表示する */
    public void print() {
        System.out.print("頂点リスト = ");
        System.out.println(vertices);
        System.out.println("隣接行列 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 無向グラフを初期化する */
        // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\n初期化後のグラフ");
        graph.print();

        /* 辺を追加する */
        // 頂点 1, 2 のインデックスはそれぞれ 0, 2
        graph.addEdge(0, 2);
        System.out.println("\n辺 1-2 を追加した後のグラフ");
        graph.print();

        /* 辺を削除する */
        // 頂点 1, 3 のインデックスはそれぞれ 0, 1
        graph.removeEdge(0, 1);
        System.out.println("\n辺 1-3 を削除した後のグラフ");
        graph.print();

        /* 頂点を追加する */
        graph.addVertex(6);
        System.out.println("\n頂点 6 を追加した後のグラフ");
        graph.print();

        /* 頂点を削除する */
        // 頂点 3 のインデックスは 1
        graph.removeVertex(1);
        System.out.println("\n頂点 3 を削除した後のグラフ");
        graph.print();
    }
}
