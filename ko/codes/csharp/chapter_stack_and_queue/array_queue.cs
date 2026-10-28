/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    int[] nums;  // 큐의 원소를 저장하는 배열
    int front;   // 맨 앞 원소를 가리키는 맨 앞 포인터
    int queSize; // 큐 길이

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 큐의 용량 반환 */
    int Capacity() {
        return nums.Length;
    }

    /* 큐의 길이 반환 */
    public int Size() {
        return queSize;
    }

    /* 큐가 비어 있는지 판단 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 큐에 삽입 */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("큐가 가득 찼다");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        int rear = (front + queSize) % Capacity();
        // num을 맨 뒤에 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int Pop() {
        int num = Peek();
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 배열 반환 */
    public int[] ToArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
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

        /* 맨 앞 원소 접근 */
        int peek = queue.Peek();
        Console.WriteLine("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.Pop();
        Console.WriteLine("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + string.Join(",", queue.ToArray()));

        /* 큐의 길이 반환 */
        int size = queue.Size();
        Console.WriteLine("큐 길이 size = " + size);

        /* 큐가 비어 있는지 판단 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("큐가 비어 있는가 = " + isEmpty);

        /* 원형 배열 테스트 */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("반복 " + i + " 회에서 삽입 + 꺼내기를 수행한 후 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
