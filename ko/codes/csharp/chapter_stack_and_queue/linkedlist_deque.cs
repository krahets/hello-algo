/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 이중 연결 리스트 노드 */
public class ListNode(int val) {
    public int val = val;       // 노드 값
    public ListNode? next = null; // 다음 노드 참조
    public ListNode? prev = null; // 이전 노드 참조
}

/* 이중 연결 리스트로 구현한 덱 */
public class LinkedListDeque {
    ListNode? front, rear; // 머리 노드 front, 꼬리 노드 rear
    int queSize = 0;      // 덱의 길이

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 덱의 길이 반환 */
    public int Size() {
        return queSize;
    }

    /* 덱이 비어 있는지 판단 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 큐 삽입 연산 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // node를 연결 리스트의 맨 앞에 추가한다
            front!.prev = node;
            node.next = front;
            front = node; // 머리 노드를 갱신한다                           
        }
        // 맨 뒤에 삽입하는 연산
        else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 꼬리 노드를 갱신한다
        }

        queSize++; // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 맨 뒤에 삽입 */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 큐에서 꺼내는 연산 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = front!.val; // 머리 노드의 값을 임시로 저장한다
            // 머리 노드를 삭제한다
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // 머리 노드를 갱신한다
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            val = rear!.val;  // 꼬리 노드의 값을 임시로 저장한다
            // 꼬리 노드를 삭제한다
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // 꼬리 노드를 갱신한다
        }

        queSize--; // 큐 길이를 갱신한다
        return val;
    }

    /* 맨 앞에서 꺼내기 */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 맨 뒤에서 꺼내기 */
    public int? PopLast() {
        return Pop(false);
    }

    /* 맨 앞 원소 접근 */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 맨 뒤 원소 접근 */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 출력에 사용할 배열 반환 */
    public int?[] ToArray() {
        ListNode? node = front;
        int?[] res = new int?[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node?.val;
            node = node?.next;
        }

        return res;
    }
}

public class linkedlist_deque {
    [Test]
    public void Test() {
        /* 덱 초기화 */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("덱 deque = " + string.Join(" ", deque.ToArray()));

        /* 원소 접근 */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("맨 앞 원소 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("맨 뒤 원소 peekLast = " + peekLast);

        /* 큐에 원소 삽입 */
        deque.PushLast(4);
        Console.WriteLine("원소 4를 맨 뒤에 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("원소 1을 맨 앞에 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 큐에서 원소 꺼내기 */
        int? popLast = deque.PopLast();
        Console.WriteLine("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 덱의 길이 반환 */
        int size = deque.Size();
        Console.WriteLine("덱 길이 size = " + size);

        /* 덱이 비어 있는지 판단 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("덱이 비어 있는가 = " + isEmpty);
    }
}
