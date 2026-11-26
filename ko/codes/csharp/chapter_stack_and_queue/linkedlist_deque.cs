/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 이중 연결 리스트의 노드 */
public class ListNode(int val) {
    public int val = val;       // 노드의 값
    public ListNode? next = null; // 다음 노드에 대한 참조
    public ListNode? prev = null; // 이전 노드에 대한 참조
}

/* 이중 연결 리스트로 구현한 덱 */
public class LinkedListDeque {
    ListNode? front, rear; // 첫 노드 front와 마지막 노드 rear
    int queSize = 0;      // 덱의 길이

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 덱의 길이 조회 */
    public int Size() {
        return queSize;
    }

    /* 덱이 비어 있는지 확인 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 삽입 연산 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // 연결 리스트의 맨 앞에 node를 추가한다
            front!.prev = node;
            node.next = front;
            front = node; // 첫 노드 갱신                           
        }
        // 맨 뒤에 삽입하는 연산
        else {
            // 연결 리스트의 맨 뒤에 node를 추가한다
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 마지막 노드 갱신
        }

        queSize++; // 덱의 길이 갱신
    }

    /* 맨 앞에 삽입 */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 맨 뒤에 삽입 */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 삭제 연산 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = front!.val; // 첫 노드의 값을 임시로 저장한다
            // 첫 노드 삭제
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // 첫 노드 갱신
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            val = rear!.val;  // 마지막 노드의 값을 임시로 저장한다
            // 마지막 노드 삭제
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // 마지막 노드 갱신
        }

        queSize--; // 덱의 길이 갱신
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

    /* 맨 앞 원소 조회 */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 맨 뒤 원소 조회 */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 출력할 배열 반환 */
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

        /* 원소 조회 */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("맨 앞 원소 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("맨 뒤 원소 peekLast = " + peekLast);

        /* 덱에 원소 삽입 */
        deque.PushLast(4);
        Console.WriteLine("맨 뒤에 원소 4를 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("맨 앞에 원소 1을 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 덱에서 원소 꺼내기 */
        int? popLast = deque.PopLast();
        Console.WriteLine("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 덱의 길이 조회 */
        int size = deque.Size();
        Console.WriteLine("덱의 길이 size = " + size);

        /* 덱이 비어 있는지 확인 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("덱이 비어 있는가 = " + isEmpty);
    }
}
