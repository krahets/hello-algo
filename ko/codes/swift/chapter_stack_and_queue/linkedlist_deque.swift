/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 이중 연결 리스트 노드 */
class ListNode {
    var val: Int // 노드 값
    var next: ListNode? // 다음 노드 참조
    weak var prev: ListNode? // 이전 노드 참조

    init(val: Int) {
        self.val = val
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private var front: ListNode? // 머리 노드 front
    private var rear: ListNode? // 꼬리 노드 rear
    private var _size: Int // 덱의 길이

    init() {
        _size = 0
    }

    /* 덱의 길이 반환 */
    func size() -> Int {
        _size
    }

    /* 덱이 비어 있는지 판단 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 큐 삽입 연산 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if isEmpty() {
            front = node
            rear = node
        }
        // 맨 앞에 삽입하는 연산
        else if isFront {
            // node를 연결 리스트의 맨 앞에 추가한다
            front?.prev = node
            node.next = front
            front = node // 머리 노드를 갱신한다
        }
        // 맨 뒤에 삽입하는 연산
        else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            rear?.next = node
            node.prev = rear
            rear = node // 꼬리 노드를 갱신한다
        }
        _size += 1 // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 맨 뒤에 삽입 */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* 큐에서 꺼내는 연산 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        let val: Int
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // 맨 앞에서 꺼내는 연산
        else if isFront {
            val = front!.val // 머리 노드의 값을 임시로 저장한다
            // 머리 노드를 삭제한다
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // 머리 노드를 갱신한다
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            val = rear!.val // 꼬리 노드의 값을 임시로 저장한다
            // 꼬리 노드를 삭제한다
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // 꼬리 노드를 갱신한다
        }
        _size -= 1 // 큐 길이를 갱신한다
        return val
    }

    /* 맨 앞에서 꺼내기 */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* 맨 뒤에서 꺼내기 */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* 맨 앞 원소 접근 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return front!.val
    }

    /* 맨 뒤 원소 접근 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return rear!.val
    }

    /* 출력에 사용할 배열 반환 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListDeque {
    /* 실행 코드 */
    static func main() {
        /* 덱 초기화 */
        let deque = LinkedListDeque()
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
