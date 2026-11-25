/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 配列を使ったスタック */
class ArrayStack {
    private var stack: [Int]

    init() {
        // リスト（動的配列）を初期化する
        stack = []
    }

    /* スタックの要素数を取得する */
    func size() -> Int {
        stack.count
    }

    /* スタックが空かどうかを判定する */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* プッシュする */
    func push(num: Int) {
        stack.append(num)
    }

    /* ポップする */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return stack.removeLast()
    }

    /* スタックのトップを参照する */
    func peek() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return stack.last!
    }

    /* スタックの要素を配列として返す */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* 実行例 */
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

        /* スタックのトップを参照する */
        let peek = stack.peek()
        print("スタックのトップの要素 peek = \(peek)")

        /* 要素をポップする */
        let pop = stack.pop()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack.toArray())")

        /* スタックの要素数を取得する */
        let size = stack.size()
        print("スタックの要素数 size = \(size)")

        /* 空かどうかを判定する */
        let isEmpty = stack.isEmpty()
        print("スタックは空か = \(isEmpty)")
    }
}
