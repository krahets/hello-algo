/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 將元素加入堆積
        Console.WriteLine($"\n將元素 {val} 加入堆積後\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 取出堆積頂端元素
        Console.WriteLine($"\n取出堆積頂端元素 {val} 後\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* 初始化堆積 */
        // 初始化最小堆積
        PriorityQueue<int, int> minHeap = new();
        // 初始化最大堆積（用 lambda 運算式修改 Comparer 即可）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("以下以最大堆積為測試案例");

        /* 將元素加入堆積 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* 取得堆積頂端元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆積頂端元素為 {peek}");

        /* 取出堆積頂端元素 */
        // 取出的元素會依照由大到小的順序排列
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* 取得堆積大小 */
        int size = maxHeap.Count;
        Console.WriteLine($"堆積中的元素個數為 {size}");

        /* 判斷堆積是否為空 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"堆積是否為空 {isEmpty}");

        /* 以輸入串列建立堆積 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("用輸入串列建立最小堆積後");
        PrintUtil.PrintHeap(minHeap);
    }
}
