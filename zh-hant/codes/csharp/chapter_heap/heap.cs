/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    [Test]
    public void Test() {
        // [region]{init}
        /* 初始化堆積 */
        // 初始化小頂堆積
        PriorityQueue<int, int> minHeap = new();
        // 初始化大頂堆積（使用 lambda 表示式修改 Comparer 即可）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("以下測試樣例為大頂堆積");

        // [region]{push}
        /* 元素入堆積 */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* 獲取堆積頂元素 */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"堆積頂元素為 {peek}");

        // [region]{pop_1}
        /* 堆積頂元素出堆積 */
        // 出堆積元素會形成一個從大到小的序列
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine($"出堆積元素為 {peek}");
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine($"出堆積元素為 {peek}");
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine($"出堆積元素為 {peek}");
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine($"出堆積元素為 {peek}");
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine($"出堆積元素為 {peek}");

        // [region]{size}
        /* 獲取堆積大小 */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"堆積元素數量為 {size}");

        // [region]{is_empty}
        /* 判斷堆積是否為空 */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"堆積是否為空 {isEmpty}");

        // [region]{heapify}
        /* 輸入串列並建堆積 */
        // 時間複雜度為 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("輸入串列並建立小頂堆積後");
        PrintUtil.PrintHeap(minHeap);
    }
}
