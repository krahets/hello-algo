/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* 実行用コード */
    static func main() {
        /* リストを初期化する */
        var nums = [1, 3, 2, 5, 4]
        print("リスト nums = \(nums)")

        /* 要素にアクセスする */
        let num = nums[1]
        print("インデックス 1 の要素にアクセスした結果 num = \(num)")

        /* 要素を更新する */
        nums[1] = 0
        print("インデックス 1 の要素を 0 に更新した結果 nums = \(nums)")

        /* リストを空にする */
        nums.removeAll()
        print("リストを空にした後 nums = \(nums)")

        /* 末尾に要素を追加する */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("要素を追加した後 nums = \(nums)")

        /* 途中に要素を挿入する */
        nums.insert(6, at: 3)
        print("インデックス 3 に数値 6 を挿入した結果 nums = \(nums)")

        /* 要素を削除する */
        nums.remove(at: 3)
        print("インデックス 3 の要素を削除した結果 nums = \(nums)")

        /* インデックスを使ってリストを走査する */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* リストの要素を直接走査する */
        count = 0
        for x in nums {
            count += x
        }

        /* 2 つのリストを連結する */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("リスト nums の後ろに nums1 を連結した結果 nums = \(nums)")

        /* リストをソートする */
        nums.sort()
        print("リストをソートした後 nums = \(nums)")
    }
}
