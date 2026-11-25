/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    int[] nums;  // 큐의 원소를 저장하는 배열
    int front;   // 맨 앞 원소를 가리키는 앞쪽 포인터
    int queSize; // 큐의 길이

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 큐의 용량 조회 */
    int Capacity() {
        return nums.Length;
    }

    /* 큐의 길이 조회 */
    public int Size() {
        return queSize;
    }

    /* 큐가 비어 있는지 확인 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 큐에 삽입 */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("큐가 가득 찼다");
            return;
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        int rear = (front + queSize) % Capacity();
        // 맨 뒤에 num을 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int Pop() {
        int num = Peek();
        // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 배열 반환 */
    public int[] ToArray() {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.Capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* 큐 초기화 */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* 큐에 원소 삽입 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("큐 queue = " + string.Join(",", queue.ToArray()));

        /* 맨 앞 원소 조회 */
        int peek = queue.Peek();
        Console.WriteLine("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.Pop();
        Console.WriteLine("꺼낸 원소 pop = " + pop + ", 꺼낸 후 queue = " + string.Join(",", queue.ToArray()));

        /* 큐의 길이 조회 */
        int size = queue.Size();
        Console.WriteLine("큐의 길이 size = " + size);

        /* 큐가 비어 있는지 확인 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("큐가 비어 있는가 = " + isEmpty);

        /* 원형 배열 테스트 */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("반복 " + i + " — 삽입 + 삭제 후 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
