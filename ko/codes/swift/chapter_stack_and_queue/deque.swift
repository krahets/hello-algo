/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 실행 예제 */
    static func main() {
        /* 덱 초기화 */
        // Swift에는 내장 덱 클래스가 없으므로 Array를 덱으로 사용할 수 있다
        var deque: [Int] = []

        /* 덱에 원소 삽입 */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("덱 deque = \(deque)")

        /* 원소 조회 */
        let peekFirst = deque.first!
        print("맨 앞 원소 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("맨 뒤 원소 peekLast = \(peekLast)")

        /* 덱에서 원소 꺼내기 */
        // Array로 구현할 때 removeFirst의 시간 복잡도는 O(n)이다
        let popFirst = deque.removeFirst()
        print("맨 앞에서 꺼낸 원소 popFirst = \(popFirst), 맨 앞에서 꺼낸 후 deque = \(deque)")
        let popLast = deque.removeLast()
        print("맨 뒤에서 꺼낸 원소 popLast = \(popLast), 맨 뒤에서 꺼낸 후 deque = \(deque)")

        /* 덱의 길이 조회 */
        let size = deque.count
        print("덱의 길이 size = \(size)")

        /* 덱이 비어 있는지 확인 */
        let isEmpty = deque.isEmpty
        print("덱이 비어 있는가 = \(isEmpty)")
    }
}
