/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 要素をヒープに挿入する
        Console.WriteLine($"\n要素 {val} の挿入後：\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 根の要素を取り出す
        Console.WriteLine($"\n根の要素 {val} を取り出した後：\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* ヒープを初期化する */
        // 最小ヒープを初期化する
        PriorityQueue<int, int> minHeap = new();
        // 最大ヒープを初期化する（ラムダ式で Comparer を変更すればよい）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("以下は最大ヒープのテスト例");

        /* 要素をヒープに挿入する */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* ヒープの根の要素を取得する */
        int peek = maxHeap.Peek();
        Console.WriteLine($"ヒープの根の要素：{peek}");

        /* 根の要素を取り出す */
        // 取り出した要素は降順に並ぶ
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* ヒープのサイズを取得する */
        int size = maxHeap.Count;
        Console.WriteLine($"ヒープの要素数：{size}");

        /* ヒープが空か判定する */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"ヒープは空か：{isEmpty}");

        /* 入力リストからヒープを構築する */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("入力リストから構築した最小ヒープ：");
        PrintUtil.PrintHeap(minHeap);
    }
}
