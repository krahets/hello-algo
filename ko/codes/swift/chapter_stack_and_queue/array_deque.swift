/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
    private var nums: [Int] // 덱의 원소를 저장하는 배열
    private var front: Int // 맨 앞 원소를 가리키는 맨 앞 포인터
    private var _size: Int // 덱 길이

    /* 생성자 */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 덱의 용량 반환 */
    func capacity() -> Int {
        nums.count
    }

    /* 덱의 길이 반환 */
    func size() -> Int {
        _size
    }

    /* 덱이 비어 있는지 판단 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 원형 배열 인덱스 계산 */
    private func index(i: Int) -> Int {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        (i + capacity()) % capacity()
    }

    /* 맨 앞에 삽입 */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("덱이 가득 찼다")
            return
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        front = index(i: front - 1)
        // num을 맨 앞에 추가한다
        nums[front] = num
        _size += 1
    }

    /* 맨 뒤에 삽입 */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("덱이 가득 찼다")
            return
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        let rear = index(i: front + size())
        // num을 맨 뒤에 추가한다
        nums[rear] = num
        _size += 1
    }

    /* 맨 앞에서 꺼내기 */
    func popFirst() -> Int {
        let num = peekFirst()
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
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

    /* 맨 앞 원소 접근 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return nums[front]
    }

    /* 맨 뒤 원소 접근 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        // 마지막 원소의 인덱스를 계산한다
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 출력에 사용할 배열 반환 */
    func toArray() -> [Int] {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* 실행 코드 */
    static func main() {
        /* 덱 초기화 */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("덱 deque = \(deque.toArray())")

        /* 원소 접근 */
        let peekFirst = deque.peekFirst()
        print("맨 앞 원소 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("맨 뒤 원소 peekLast = \(peekLast)")

        /* 큐에 원소 삽입 */
        deque.pushLast(num: 4)
        print("맨 뒤에 원소 4를 삽입한 후 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("맨 앞에 원소 1을 삽입한 후 deque = \(deque.toArray())")

        /* 큐에서 원소 꺼내기 */
        let popLast = deque.popLast()
        print("맨 뒤에서 꺼낸 원소 = \(popLast), 꺼낸 후 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("맨 앞에서 꺼낸 원소 = \(popFirst), 꺼낸 후 deque = \(deque.toArray())")

        /* 덱의 길이 반환 */
        let size = deque.size()
        print("덱의 길이 size = \(size)")

        /* 덱이 비어 있는지 판단 */
        let isEmpty = deque.isEmpty()
        print("덱이 비어 있는가 = \(isEmpty)")
    }
}
