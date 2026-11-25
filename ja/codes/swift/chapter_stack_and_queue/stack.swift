/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* 実行例 */
    static func main() {
        /* スタックを初期化する */
        // Swift には組み込みのスタッククラスがないので、Array をスタックとして使える
        var stack: [Int] = []

        /* 要素をプッシュする */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("スタック stack = \(stack)")

        /* スタックのトップを参照する */
        let peek = stack.last!
        print("スタックのトップの要素 peek = \(peek)")

        /* 要素をポップする */
        let pop = stack.removeLast()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack)")

        /* スタックの要素数を取得する */
        let size = stack.count
        print("スタックの要素数 size = \(size)")

        /* 空かどうかを判定する */
        let isEmpty = stack.isEmpty
        print("スタックは空か = \(isEmpty)")
    }
}
