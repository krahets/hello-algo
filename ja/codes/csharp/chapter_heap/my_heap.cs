/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 最大ヒープ */
class MaxHeap {
    // 配列の代わりにリストを使えば、容量の拡張を自分で扱う必要がない
    List<int> maxHeap;

    /* 空のヒープを作るコンストラクタ */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 入力リストからヒープを構築するコンストラクタ */
    public MaxHeap(IEnumerable<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new List<int>(nums);
        // 葉以外のすべてのノードをヒープ化する
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 左の子のインデックスを取得する */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得する */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得する */
    int Parent(int i) {
        return (i - 1) / 2; // 商を 0 方向に丸める
    }

    /* ヒープの根の要素を参照する */
    public int Peek() {
        return maxHeap[0];
    }

    /* 要素をヒープに挿入する */
    public void Push(int val) {
        // ノードを追加する
        maxHeap.Add(val);
        // 上に向かってヒープ化する
        SiftUp(Size() - 1);
    }

    /* ヒープのサイズを取得する */
    public int Size() {
        return maxHeap.Count;
    }

    /* ヒープが空か判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* ノード i から上に向かってヒープ化する */
    void SiftUp(int i) {
        while (true) {
            // ノード i の親を取得する
            int p = Parent(i);
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            Swap(i, p);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* 根の要素をヒープから取り出す */
    public int Pop() {
        // 空の場合の処理
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        Swap(0, Size() - 1);
        // ノードを削除する
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 下に向かってヒープ化する
        SiftDown(0);
        // 根の要素を返す
        return val;
    }

    /* ノード i から下に向かってヒープ化する */
    void SiftDown(int i) {
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大になるか、葉を越えたら、ヒープ化を終える
            if (ma == i) break;
            // 2 つのノードを交換する
            Swap(i, ma);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

    /* 要素を交換する */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* ヒープを二分木として表示する */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 最大ヒープを初期化する */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\n入力リストから構築したヒープ：");
        maxHeap.Print();

        /* ヒープの根の要素を取得する */
        int peek = maxHeap.Peek();
        Console.WriteLine($"ヒープの根の要素：{peek}");

        /* 要素をヒープに挿入する */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"要素 {val} の挿入後：");
        maxHeap.Print();

        /* 根の要素を取り出す */
        peek = maxHeap.Pop();
        Console.WriteLine($"根の要素 {peek} を取り出した後：");
        maxHeap.Print();

        /* ヒープのサイズを取得する */
        int size = maxHeap.Size();
        Console.WriteLine($"ヒープの要素数：{size}");

        /* ヒープが空か判定する */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"ヒープは空か：{isEmpty}");
    }
}
