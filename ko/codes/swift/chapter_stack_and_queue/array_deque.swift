/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
    private var nums: [Int] // 덱의 원소를 저장하는 배열
    private var front: Int // 맨 앞 원소를 가리키는 앞쪽 포인터
    private var _size: Int // 덱의 길이

    /* 생성자 */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 덱의 용량 조회 */
    func capacity() -> Int {
        nums.count
    }

    /* 덱의 길이 조회 */
    func size() -> Int {
        _size
    }

    /* 덱이 비어 있는지 확인 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 원형 배열의 인덱스 계산 */
    private func index(i: Int) -> Int {
        // 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘으면 처음으로 돌아간다
        // i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
        (i + capacity()) % capacity()
    }

    /* 맨 앞에 삽입 */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("덱이 가득 찼다")
            return
        }
        // 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
        // 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
        front = index(i: front - 1)
        // 맨 앞에 num을 추가한다
        nums[front] = num
        _size += 1
    }

    /* 맨 뒤에 삽입 */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("덱이 가득 찼다")
            return
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        let rear = index(i: front + size())
        // 맨 뒤에 num을 추가한다
        nums[rear] = num
        _size += 1
    }

    /* 맨 앞에서 꺼내기 */
    func popFirst() -> Int {
        let num = peekFirst()
        // 앞쪽 포인터를 한 칸 전진시킨다
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* 맨 뒤에서 꺼내기 */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* 맨 앞 원소 조회 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return nums[front]
    }

    /* 맨 뒤 원소 조회 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        // 맨 뒤 원소의 인덱스 계산
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 출력할 배열 반환 */
    func toArray() -> [Int] {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* 실행 예제 */
    static func main() {
        /* 덱 초기화 */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("덱 deque = \(deque.toArray())")

        /* 원소 조회 */
        let peekFirst = deque.peekFirst()
        print("맨 앞 원소 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("맨 뒤 원소 peekLast = \(peekLast)")

        /* 덱에 원소 삽입 */
        deque.pushLast(num: 4)
        print("맨 뒤에 원소 4를 삽입한 후 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("맨 앞에 원소 1을 삽입한 후 deque = \(deque.toArray())")

        /* 덱에서 원소 꺼내기 */
        let popLast = deque.popLast()
        print("맨 뒤에서 꺼낸 원소 = \(popLast), 맨 뒤에서 꺼낸 후 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("맨 앞에서 꺼낸 원소 = \(popFirst), 맨 앞에서 꺼낸 후 deque = \(deque.toArray())")

        /* 덱의 길이 조회 */
        let size = deque.size()
        print("덱의 길이 size = \(size)")

        /* 덱이 비어 있는지 확인 */
        let isEmpty = deque.isEmpty()
        print("덱이 비어 있는가 = \(isEmpty)")
    }
}
