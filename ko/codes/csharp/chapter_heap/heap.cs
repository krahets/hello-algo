/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 힙에 원소 삽입
        Console.WriteLine($"\n힙에 원소를 삽입한 후(원소: {val})\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 힙의 루트 원소 꺼내기
        Console.WriteLine($"\n힙의 루트 원소를 꺼낸 후(원소: {val})\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* 힙 초기화 */
        // 최소 힙 초기화
        PriorityQueue<int, int> minHeap = new();
        // 최대 힙 초기화(람다 식으로 Comparer를 변경하면 된다)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("다음 테스트 예제는 최대 힙이다");

        /* 힙에 원소 삽입 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"힙의 루트 원소: {peek}");

        /* 힙의 루트 원소 꺼내기 */
        // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* 힙 크기 반환 */
        int size = maxHeap.Count;
        Console.WriteLine($"힙의 원소 개수: {size}");

        /* 힙이 비어 있는지 판단 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"힙이 비어 있는가: {isEmpty}");

        /* 리스트를 입력하여 힙 구성 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("리스트를 입력하여 최소 힙을 구성한 후");
        PrintUtil.PrintHeap(minHeap);
    }
}
