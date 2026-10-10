/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 要素をヒープに追加
        Console.WriteLine($"\n要素 {val} をヒープに追加した後\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // ヒープ頂点の要素を取り出す
        Console.WriteLine($"\nヒープの先頭要素 {val} を取り出した後\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* ヒープを初期化 */
        // 最小ヒープを初期化
        PriorityQueue<int, int> minHeap = new();
        // 最大ヒープを初期化する（Comparer はラムダ式で変更できる）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("以下のテストケースは最大ヒープです");

        /* 要素をヒープに追加 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* ヒープ頂点の要素を取得 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"ヒープの先頭要素は {peek}");

        /* ヒープ頂点の要素を取り出す */
        // ヒープから取り出した要素は大きい順に並ぶ
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* ヒープのサイズを取得 */
        int size = maxHeap.Count;
        Console.WriteLine($"ヒープの要素数は {size}");

        /* ヒープが空かどうかを判定 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"ヒープは空か {isEmpty}");

        /* リストを入力してヒープを構築 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("リストを入力して最小ヒープを構築した後");
        PrintUtil.PrintHeap(minHeap);
    }
}
