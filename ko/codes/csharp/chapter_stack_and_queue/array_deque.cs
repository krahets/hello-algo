/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 원형 배열로 구현한 덱 */
public class ArrayDeque {
    int[] nums;  // 덱의 원소를 저장하는 배열
    int front;   // 맨 앞 원소를 가리키는 맨 앞 포인터
    int queSize; // 덱 길이

    /* 생성자 */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 덱의 용량 반환 */
    int Capacity() {
        return nums.Length;
    }

    /* 덱의 길이 반환 */
    public int Size() {
        return queSize;
    }

    /* 덱이 비어 있는지 판단 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 원형 배열 인덱스 계산 */
    int Index(int i) {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + Capacity()) % Capacity();
    }

    /* 맨 앞에 삽입 */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("덱이 가득 찼다");
            return;
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        front = Index(front - 1);
        // num을 맨 앞에 추가한다
        nums[front] = num;
        queSize++;
    }

    /* 맨 뒤에 삽입 */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("덱이 가득 찼다");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        int rear = Index(front + queSize);
        // num을 맨 뒤에 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 맨 앞에서 꺼내기 */
    public int PopFirst() {
        int num = PeekFirst();
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 맨 뒤에서 꺼내기 */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* 맨 뒤 원소 접근 */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 마지막 원소의 인덱스를 계산한다
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 출력에 사용할 배열 반환 */
    public int[] ToArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[Index(j)];
        }
        return res;
    }
}

public class array_deque {
    [Test]
    public void Test() {
        /* 덱 초기화 */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("덱 deque = " + string.Join(" ", deque.ToArray()));

        /* 원소 접근 */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("맨 앞 원소 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("맨 뒤 원소 peekLast = " + peekLast);

        /* 큐에 원소 삽입 */
        deque.PushLast(4);
        Console.WriteLine("원소 4를 맨 뒤에 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("원소 1을 맨 앞에 삽입한 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 큐에서 원소 꺼내기 */
        int popLast = deque.PopLast();
        Console.WriteLine("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + string.Join(" ", deque.ToArray()));

        /* 덱의 길이 반환 */
        int size = deque.Size();
        Console.WriteLine("덱 길이 size = " + size);

        /* 덱이 비어 있는지 판단 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("덱이 비어 있는가 = " + isEmpty);
    }
}
