/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 이중 연결 리스트의 노드 */
class ListNode {
    var val: Int // 노드의 값
    var next: ListNode? // 다음 노드에 대한 참조
    weak var prev: ListNode? // 이전 노드에 대한 참조

    init(val: Int) {
        self.val = val
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private var front: ListNode? // 첫 노드 front
    private var rear: ListNode? // 마지막 노드 rear
    private var _size: Int // 덱의 길이

    init() {
        _size = 0
    }

    /* 덱의 길이 조회 */
    func size() -> Int {
        _size
    }

    /* 덱이 비어 있는지 확인 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 삽입 연산 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if isEmpty() {
            front = node
            rear = node
        }
        // 맨 앞에 삽입하는 연산
        else if isFront {
            // 연결 리스트의 맨 앞에 node를 추가한다
            front?.prev = node
            node.next = front
            front = node // 첫 노드 갱신
        }
        // 맨 뒤에 삽입하는 연산
        else {
            // 연결 리스트의 맨 뒤에 node를 추가한다
            rear?.next = node
            node.prev = rear
            rear = node // 마지막 노드 갱신
        }
        _size += 1 // 덱의 길이 갱신
    }

    /* 맨 앞에 삽입 */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 맨 뒤에 삽입 */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* 삭제 연산 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        let val: Int
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // 맨 앞에서 꺼내는 연산
        else if isFront {
            val = front!.val // 첫 노드의 값을 임시로 저장한다
            // 첫 노드 삭제
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // 첫 노드 갱신
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            val = rear!.val // 마지막 노드의 값을 임시로 저장한다
            // 마지막 노드 삭제
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // 마지막 노드 갱신
        }
        _size -= 1 // 덱의 길이 갱신
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

    /* 맨 앞 원소 조회 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return front!.val
    }

    /* 맨 뒤 원소 조회 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("덱이 비어 있다")
        }
        return rear!.val
    }

    /* 출력할 배열 반환 */
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
    /* 실행 예제 */
    static func main() {
        /* 덱 초기화 */
        let deque = LinkedListDeque()
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
