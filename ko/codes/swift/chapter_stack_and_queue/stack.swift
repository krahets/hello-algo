/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* 실행 코드 */
    static func main() {
        // [region]{init_stack}
        /* 스택 초기화 */
        // Swift에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
        var stack: [Int] = []
        // [endregion]{init_stack}

        // [region]{push}
        /* 스택에 원소 삽입 */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        // [endregion]{push}
        print("스택 stack = \(stack)")

        // [region]{peek}
        /* 스택 맨 위 원소 접근 */
        let peek = stack.last!
        // [endregion]{peek}
        print("스택의 맨 위 원소 peek = \(peek)")

        // [region]{pop}
        /* 스택에서 원소 꺼내기 */
        let pop = stack.removeLast()
        // [endregion]{pop}
        print("스택에서 꺼낸 원소 pop = \(pop), 꺼낸 후 stack = \(stack)")

        // [region]{size}
        /* 스택의 길이 반환 */
        let size = stack.count
        // [endregion]{size}
        print("스택의 길이 size = \(size)")

        // [region]{is_empty}
        /* 비어 있는지 판단 */
        let isEmpty = stack.isEmpty
        // [endregion]{is_empty}
        print("스택이 비어 있는가 = \(isEmpty)")
    }
}
