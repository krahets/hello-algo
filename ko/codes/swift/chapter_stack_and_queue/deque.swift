/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 실행 코드 */
    static func main() {
        // [region]{init_deque}
        /* 덱 초기화 */
        // Swift에는 내장 덱 클래스가 없으므로 Array를 덱으로 사용할 수 있다
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* 원소 삽입 */
        deque.append(2) // 맨 뒤에 추가한다
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // 맨 앞에 추가한다
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("덱 deque = \(deque)")

        // [region]{peek_first}
        /* 원소 접근 */
        let peekFirst = deque.first! // 맨 앞 원소
        // [endregion]{peek_first}
        print("맨 앞 원소 peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // 맨 뒤 원소
        // [endregion]{peek_last}
        print("맨 뒤 원소 peekLast = \(peekLast)")

        // [region]{pop_first}
        /* 원소 꺼내기 */
        // Array로 구현할 때 popFirst의 시간 복잡도는 O(n)이다
        let popFirst = deque.removeFirst() // 맨 앞 원소를 꺼낸다
        // [endregion]{pop_first}
        print("맨 앞에서 꺼낸 원소 popFirst = \(popFirst), 꺼낸 후 deque = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // 맨 뒤 원소를 꺼낸다
        // [endregion]{pop_last}
        print("맨 뒤에서 꺼낸 원소 popLast = \(popLast), 꺼낸 후 deque = \(deque)")

        // [region]{size}
        /* 덱의 길이 반환 */
        let size = deque.count
        // [endregion]{size}
        print("덱의 길이 size = \(size)")

        // [region]{is_empty}
        /* 덱이 비어 있는지 판단 */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("덱이 비어 있는가 = \(isEmpty)")
    }
}
