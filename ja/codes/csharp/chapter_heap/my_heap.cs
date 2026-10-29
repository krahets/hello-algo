/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 最大ヒープ */
class MaxHeap {
    // 配列ではなくリストを使うため、容量の拡張を考慮する必要がない
    List<int> maxHeap;

    /* コンストラクタ：空のヒープを構築する */
    public MaxHeap() {
        maxHeap = [];
    }

    /* コンストラクタ：入力リストからヒープを構築する */
    public MaxHeap(IEnumerable<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new List<int>(nums);
        // 葉ノード以外の全ノードをヒープ化する
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 左の子のインデックスを取得 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int Parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }

    /* ヒープの先頭要素にアクセスする */
    public int Peek() {
        return maxHeap[0];
    }

    /* ヒープに要素を挿入する */
    public void Push(int val) {
        // ノードを追加する
        maxHeap.Add(val);
        // 下から上へヒープ化する
        SiftUp(Size() - 1);
    }

    /* ヒープのサイズを取得する */
    public int Size() {
        return maxHeap.Count;
    }

    /* ヒープが空か判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* ノード i から上向きにヒープ化する */
    void SiftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = Parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            Swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }

    /* ヒープから要素を取り出す */
    public int Pop() {
        // 空かどうかを確認する
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        Swap(0, Size() - 1);
        // ノードを削除する
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 上から下へヒープ化する
        SiftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    void SiftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 「ノード i の値が最大」または「葉ノードを越えた」場合、ヒープ化を終了する
            if (ma == i) break;
            // 2 つのノードを交換する
            Swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

    /* 要素を交換する */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* ヒープ（二分木）を表示する */
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
        Console.WriteLine("\nリストを入力してヒープを構築した後");
        maxHeap.Print();

        /* ヒープの先頭要素を取得する */
        int peek = maxHeap.Peek();
        Console.WriteLine($"ヒープの先頭要素は {peek}");

        /* ヒープに要素を挿入する */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"要素 {val} をヒープに挿入した後");
        maxHeap.Print();

        /* ヒープの先頭要素を取り出す */
        peek = maxHeap.Pop();
        Console.WriteLine($"ヒープの先頭要素 {peek} を取り出した後");
        maxHeap.Print();

        /* ヒープのサイズを取得する */
        int size = maxHeap.Size();
        Console.WriteLine($"ヒープの要素数は {size}");

        /* ヒープが空か判定 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"ヒープは空か {isEmpty}");
    }
}
