/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 힙에 원소 삽입
        Console.WriteLine($"\n원소 {val} 삽입 후\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 힙의 루트 원소 꺼내기
        Console.WriteLine($"\n루트 원소 {val}을 꺼낸 뒤의 힙\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* 힙 초기화 */
        // 최소 힙 초기화
        PriorityQueue<int, int> minHeap = new();
        // 최대 힙 초기화(람다 식으로 Comparer를 변경하면 됨)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("다음은 최대 힙 테스트 예제다.");

        /* 힙에 원소 삽입 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* 힙의 루트 원소 구하기 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"힙의 루트 원소: {peek}");

        /* 힙의 루트 원소 꺼내기 */
        // 힙에서 꺼낸 원소는 내림차순 수열을 이룸
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* 힙 크기 구하기 */
        int size = maxHeap.Count;
        Console.WriteLine($"힙의 원소 수: {size}");

        /* 힙이 비었는지 확인 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"빈 힙 여부: {isEmpty}");

        /* 입력 리스트로 힙 구성 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("입력 리스트로 만든 최소 힙");
        PrintUtil.PrintHeap(minHeap);
    }
}
