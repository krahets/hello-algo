/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    private var nums: [Int] // 큐의 원소를 저장하는 배열
    private var front: Int // 맨 앞 원소를 가리키는 앞쪽 포인터
    private var _size: Int // 큐의 길이

    init(capacity: Int) {
        // 배열 초기화
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 큐의 용량 조회 */
    func capacity() -> Int {
        nums.count
    }

    /* 큐의 길이 조회 */
    func size() -> Int {
        _size
    }

    /* 큐가 비어 있는지 확인 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 큐에 삽입 */
    func push(num: Int) {
        if size() == capacity() {
            print("큐가 가득 찼다")
            return
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        let rear = (front + size()) % capacity()
        // 맨 뒤에 num을 추가한다
        nums[rear] = num
        _size += 1
    }

    /* 큐에서 꺼내기 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* 맨 앞 원소 조회 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("큐가 비어 있다")
        }
        return nums[front]
    }

    /* 배열 반환 */
    func toArray() -> [Int] {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* 실행 예제 */
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

        /* 맨 앞 원소 조회 */
        let peek = queue.peek()
        print("맨 앞 원소 peek = \(peek)")

        /* 큐에서 원소 꺼내기 */
        let pop = queue.pop()
        print("꺼낸 원소 pop = \(pop), 꺼낸 후 queue = \(queue.toArray())")

        /* 큐의 길이 조회 */
        let size = queue.size()
        print("큐의 길이 size = \(size)")

        /* 큐가 비어 있는지 확인 */
        let isEmpty = queue.isEmpty()
        print("큐가 비어 있는가 = \(isEmpty)")

        /* 원형 배열 테스트 */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("반복 \(i) — 삽입 + 삭제 후 queue = \(queue.toArray())")
        }
    }
}
