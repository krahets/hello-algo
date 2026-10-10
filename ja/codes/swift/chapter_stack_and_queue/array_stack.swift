/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 配列ベースのスタック */
class ArrayStack {
    private var stack: [Int]

    init() {
        // リスト（動的配列）を初期化する
        stack = []
    }

    /* スタックの長さを取得 */
    func size() -> Int {
        stack.count
    }

    /* スタックが空かどうかを判定 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* プッシュ */
    func push(num: Int) {
        stack.append(num)
    }

    /* ポップ */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return stack.removeLast()
    }

    /* スタックトップの要素にアクセス */
    func peek() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return stack.last!
    }

    /* List を Array に変換して返す */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* スタックを初期化 */
        let stack = ArrayStack()

        /* 要素をプッシュ */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("スタック stack = \(stack.toArray())")

        /* スタックトップの要素にアクセス */
        let peek = stack.peek()
        print("スタックトップ要素 peek = \(peek)")

        /* 要素をポップ */
        let pop = stack.pop()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack.toArray())")

        /* スタックの長さを取得 */
        let size = stack.size()
        print("スタックの長さ size = \(size)")

        /* 空かどうかを判定 */
        let isEmpty = stack.isEmpty()
        print("スタックが空かどうか = \(isEmpty)")
    }
}
