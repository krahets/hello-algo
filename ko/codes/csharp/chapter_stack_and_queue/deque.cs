/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        // [region]{init_deque}
        /* 덱 초기화 */
        // C#에서는 연결 리스트 LinkedList를 덱으로 사용한다
        LinkedList<int> deque = new();
        // [endregion]{init_deque}

        // [region]{push}
        /* 원소 삽입 */
        deque.AddLast(2);   // 맨 뒤에 추가한다
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 맨 앞에 추가한다
        deque.AddFirst(1);
        // [endregion]{push}
        Console.WriteLine("덱 deque = " + string.Join(",", deque));

        // [region]{peek_first}
        /* 원소 접근 */
        int? peekFirst = deque.First?.Value;  // 맨 앞 원소
        // [endregion]{peek_first}
        Console.WriteLine("맨 앞 원소 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int? peekLast = deque.Last?.Value;    // 맨 뒤 원소
        // [endregion]{peek_last}
        Console.WriteLine("맨 뒤 원소 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 원소 꺼내기 */
        deque.RemoveFirst();  // 맨 앞 원소를 꺼낸다
        // [endregion]{pop_first}
        Console.WriteLine("맨 앞 원소를 꺼낸 후 deque = " + string.Join(",", deque));
        // [region]{pop_last}
        deque.RemoveLast();   // 맨 뒤 원소를 꺼낸다
        // [endregion]{pop_last}
        Console.WriteLine("맨 뒤 원소를 꺼낸 후 deque = " + string.Join(",", deque));

        // [region]{size}
        /* 덱의 길이 반환 */
        int size = deque.Count;
        // [endregion]{size}
        Console.WriteLine("덱 길이 size = " + size);

        // [region]{is_empty}
        /* 덱이 비어 있는지 판단 */
        bool isEmpty = deque.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("덱이 비어 있는가 = " + isEmpty);
    }
}
