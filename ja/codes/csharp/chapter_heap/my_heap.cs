/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 最大ヒープ */
class MaxHeap {
    // 配列ではなくリストを使うことで、拡張を考慮する必要がない
    List<int> maxHeap;

    /* コンストラクタ。空のヒープを作成する */
    public MaxHeap() {
        maxHeap = [];
    }

    /* コンストラクタ。入力リストに基づいてヒープを構築 */
    public MaxHeap(IEnumerable<int> nums) {
        // リスト要素をそのままヒープに追加
        maxHeap = new List<int>(nums);
        // 葉ノード以外のすべてのノードをヒープ化
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 左子ノードのインデックスを取得 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int Parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }

    /* ヒープ先頭要素にアクセス */
    public int Peek() {
        return maxHeap[0];
    }

    /* 要素をヒープに追加 */
    public void Push(int val) {
        // ノードを追加
        maxHeap.Add(val);
        // 下から上へヒープ化
        SiftUp(Size() - 1);
    }

    /* ヒープのサイズを取得 */
    public int Size() {
        return maxHeap.Count;
    }

    /* ヒープが空かどうかを判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void SiftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = Parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」な場合は、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換
            Swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }

    /* 要素をヒープから取り出す */
    public int Pop() {
        // 空判定の処理
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        Swap(0, Size() - 1);
        // ノードを削除
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 上から下へヒープ化
        SiftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void SiftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 「ノード i が最大」または「葉ノードを越えた」場合は、ヒープ化を終了する
            if (ma == i) break;
            // 2 つのノードを交換
            Swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }

    /* 要素を交換 */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* ヒープ（二分木）を出力 */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 最大ヒープを初期化 */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nリストを入力してヒープを構築した後");
        maxHeap.Print();

        /* ヒープ頂点の要素を取得 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"ヒープの先頭要素は {peek}");

        /* 要素をヒープに追加 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"要素 {val} をヒープに追加した後");
        maxHeap.Print();

        /* ヒープ頂点の要素を取り出す */
        peek = maxHeap.Pop();
        Console.WriteLine($"ヒープの先頭要素 {peek} を取り出した後");
        maxHeap.Print();

        /* ヒープのサイズを取得 */
        int size = maxHeap.Size();
        Console.WriteLine($"ヒープの要素数は {size}");

        /* ヒープが空かどうかを判定 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"ヒープは空か {isEmpty}");
    }
}
