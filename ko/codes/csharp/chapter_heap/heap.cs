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
        /* 힙 초기화 */
        // 최소 힙 초기화
        PriorityQueue<int, int> minHeap = new();
        // 최대 힙 초기화(람다 식으로 Comparer를 변경하면 된다)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("다음 테스트 예제는 최대 힙이다");

        // [region]{push}
        /* 힙에 원소 삽입 */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"힙의 루트 원소: {peek}");

        // [region]{pop_1}
        /* 힙의 루트 원소 꺼내기 */
        // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine($"힙에서 꺼낸 원소: {peek}");
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine($"힙에서 꺼낸 원소: {peek}");
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine($"힙에서 꺼낸 원소: {peek}");
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine($"힙에서 꺼낸 원소: {peek}");
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine($"힙에서 꺼낸 원소: {peek}");

        // [region]{size}
        /* 힙 크기 반환 */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"힙의 원소 개수: {size}");

        // [region]{is_empty}
        /* 힙이 비어 있는지 판단 */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"힙이 비어 있는가: {isEmpty}");

        // [region]{heapify}
        /* 리스트를 입력하여 힙 구성 */
        // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("리스트를 입력하여 최소 힙을 구성한 후");
        PrintUtil.PrintHeap(minHeap);
    }
}
