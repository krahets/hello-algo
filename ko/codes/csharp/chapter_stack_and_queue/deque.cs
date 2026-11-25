/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 덱 초기화 */
        // C#에서는 연결 리스트인 LinkedList를 덱으로 사용한다
        LinkedList<int> deque = new();

        /* 덱에 원소 삽입 */
        deque.AddLast(2);   // 맨 뒤에 추가
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 맨 앞에 추가
        deque.AddFirst(1);
        Console.WriteLine("덱 deque = " + string.Join(",", deque));

        /* 원소 조회 */
        int? peekFirst = deque.First?.Value;  // 맨 앞 원소
        Console.WriteLine("맨 앞 원소 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 맨 뒤 원소
        Console.WriteLine("맨 뒤 원소 peekLast = " + peekLast);

        /* 덱에서 원소 꺼내기 */
        deque.RemoveFirst();  // 맨 앞에서 원소 꺼내기
        Console.WriteLine("맨 앞 원소를 꺼낸 후 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 맨 뒤에서 원소 꺼내기
        Console.WriteLine("맨 뒤 원소를 꺼낸 후 deque = " + string.Join(",", deque));

        /* 덱의 길이 조회 */
        int size = deque.Count;
        Console.WriteLine("덱의 길이 size = " + size);

        /* 덱이 비어 있는지 확인 */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("덱이 비어 있는가 = " + isEmpty);
    }
}
