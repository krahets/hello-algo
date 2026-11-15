/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* 実行用コード */
    static func main() {
        // [region]{init_stack}
        /* スタックを初期化する */
        // Swift には組み込みのスタッククラスがないため、Array をスタックとして使える
        var stack: [Int] = []
        // [endregion]{init_stack}

        // [region]{push}
        /* 要素をプッシュする */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        // [endregion]{push}
        print("スタック stack = \(stack)")

        // [region]{peek}
        /* スタックの先頭要素にアクセスする */
        let peek = stack.last!
        // [endregion]{peek}
        print("スタックの先頭要素 peek = \(peek)")

        // [region]{pop}
        /* 要素をポップする */
        let pop = stack.removeLast()
        // [endregion]{pop}
        print("ポップした要素 pop = \(pop)、ポップ後 stack = \(stack)")

        // [region]{size}
        /* スタックの長さを取得する */
        let size = stack.count
        // [endregion]{size}
        print("スタックの長さ size = \(size)")

        // [region]{is_empty}
        /* 空かどうかを判定する */
        let isEmpty = stack.isEmpty
        // [endregion]{is_empty}
        print("スタックは空か = \(isEmpty)")
    }
}
