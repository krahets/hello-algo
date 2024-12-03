/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 元素入堆積
        Console.WriteLine($"\n元素 {val} 入堆積後\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 堆積頂元素出堆積
        Console.WriteLine($"\n堆積頂元素 {val} 出堆積後\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* 初始化堆積 */
        // 初始化小頂堆積
        PriorityQueue<int, int> minHeap = new();
        // 初始化大頂堆積（使用 lambda 表示式修改 Comparer 即可）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("以下測試樣例為大頂堆積");

        /* 元素入堆積 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* 獲取堆積頂元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆積頂元素為 {peek}");

        /* 堆積頂元素出堆積 */
        // 出堆積元素會形成一個從大到小的序列
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* 獲取堆積大小 */
        int size = maxHeap.Count;
        Console.WriteLine($"堆積元素數量為 {size}");

        /* 判斷堆積是否為空 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"堆積是否為空 {isEmpty}");

        /* 輸入串列並建堆積 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("輸入串列並建立小頂堆積後");
        PrintUtil.PrintHeap(minHeap);
    }
}
