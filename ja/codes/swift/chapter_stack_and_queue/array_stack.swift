/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 配列で実装したスタック */
class ArrayStack {
    private var stack: [Int]

    init() {
        // リスト（動的配列）を初期化する
        stack = []
    }

    /* スタックの長さを取得する */
    func size() -> Int {
        stack.count
    }

    /* スタックが空かどうかを判定する */
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

    /* スタックの先頭要素にアクセスする */
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
    /* 実行用コード */
    static func main() {
        /* スタックを初期化する */
        let stack = ArrayStack()

        /* 要素をプッシュする */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("スタック stack = \(stack.toArray())")

        /* スタックの先頭要素にアクセスする */
        let peek = stack.peek()
        print("スタックの先頭要素 peek = \(peek)")

        /* 要素をポップする */
        let pop = stack.pop()
        print("ポップした要素 pop = \(pop)、ポップ後 stack = \(stack.toArray())")

        /* スタックの長さを取得する */
        let size = stack.size()
        print("スタックの長さ size = \(size)")

        /* 空かどうかを判定する */
        let isEmpty = stack.isEmpty()
        print("スタックは空か = \(isEmpty)")
    }
}
