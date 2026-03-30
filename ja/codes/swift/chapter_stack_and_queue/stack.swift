/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* スタックを初期化 */
        // Swift には組み込みのスタッククラスがないため、Array をスタックとして使う
        var stack: [Int] = []

        /* 要素をプッシュ */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("スタック stack = \(stack)")

        /* スタックトップの要素にアクセス */
        let peek = stack.last!
        print("スタックトップ要素 peek = \(peek)")

        /* 要素をポップ */
        let pop = stack.removeLast()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack)")

        /* スタックの長さを取得 */
        let size = stack.count
        print("スタックの長さ size = \(size)")

        /* 空かどうかを判定 */
        let isEmpty = stack.isEmpty
        print("スタックが空かどうか = \(isEmpty)")
    }
}
