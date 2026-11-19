/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* 실행 코드 */
    static func main() {
        // [region]{init_queue}
        /* 큐 초기화 */
        // Swift에는 내장 큐 클래스가 없으므로 Array를 큐로 사용할 수 있다
        var queue: [Int] = []
        // [endregion]{init_queue}

        // [region]{push}
        /* 원소 삽입 */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        // [endregion]{push}
        print("큐 queue = \(queue)")

        // [region]{peek}
        /* 맨 앞 원소 접근 */
        let peek = queue.first!
        // [endregion]{peek}
        print("맨 앞 원소 peek = \(peek)")

        // [region]{pop}
        /* 원소 꺼내기 */
        // Array로 구현할 때 removeFirst의 복잡도는 O(n)이다
        let pop = queue.removeFirst()
        // [endregion]{pop}
        print("큐에서 꺼낸 원소 pop = \(pop), 꺼낸 후 queue = \(queue)")

        // [region]{size}
        /* 큐의 길이 반환 */
        let size = queue.count
        // [endregion]{size}
        print("큐의 길이 size = \(size)")

        // [region]{is_empty}
        /* 큐가 비어 있는지 판단 */
        let isEmpty = queue.isEmpty
        // [endregion]{is_empty}
        print("큐가 비어 있는가 = \(isEmpty)")
    }
}
