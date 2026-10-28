/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    private var nums: [Int] // 큐의 원소를 저장하는 배열
    private var front: Int // 맨 앞 원소를 가리키는 맨 앞 포인터
    private var _size: Int // 큐 길이

    init(capacity: Int) {
        // 배열 초기화
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 큐의 용량 반환 */
    func capacity() -> Int {
        nums.count
    }

    /* 큐의 길이 반환 */
    func size() -> Int {
        _size
    }

    /* 큐가 비어 있는지 판단 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 큐에 삽입 */
    func push(num: Int) {
        if size() == capacity() {
            print("큐가 가득 찼다")
            return
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        let rear = (front + size()) % capacity()
        // num을 맨 뒤에 추가한다
        nums[rear] = num
        _size += 1
    }

    /* 큐에서 꺼내기 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* 맨 앞 원소 접근 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("큐가 비어 있다")
        }
        return nums[front]
    }

    /* 배열 반환 */
    func toArray() -> [Int] {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* 실행 코드 */
    static func main() {
        /* 큐 초기화 */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* 큐에 원소 삽입 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("큐 queue = \(queue.toArray())")

        /* 맨 앞 원소 접근 */
        let peek = queue.peek()
        print("맨 앞 원소 peek = \(peek)")

        /* 큐에서 원소 꺼내기 */
        let pop = queue.pop()
        print("큐에서 꺼낸 원소 pop = \(pop), 꺼낸 후 queue = \(queue.toArray())")

        /* 큐의 길이 반환 */
        let size = queue.size()
        print("큐의 길이 size = \(size)")

        /* 큐가 비어 있는지 판단 */
        let isEmpty = queue.isEmpty()
        print("큐가 비어 있는가 = \(isEmpty)")

        /* 원형 배열 테스트 */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("반복 \(i): 삽입 + 꺼내기 후 queue = \(queue.toArray())")
        }
    }
}
