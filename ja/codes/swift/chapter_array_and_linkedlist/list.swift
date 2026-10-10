/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* リストを初期化 */
        var nums = [1, 3, 2, 5, 4]
        print("リスト nums = \(nums)")

        /* 要素にアクセス */
        let num = nums[1]
        print("インデックス 1 の要素にアクセスすると、num = \(num)")

        /* 要素を更新 */
        nums[1] = 0
        print("インデックス 1 の要素を 0 に更新すると、nums = \(nums)")

        /* リストを空にする */
        nums.removeAll()
        print("リストを空にした後、nums = \(nums)")

        /* 末尾に要素を追加 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("要素追加後、nums = \(nums)")

        /* 中間に要素を挿入 */
        nums.insert(6, at: 3)
        print("インデックス 3 に数値 6 を挿入すると、nums = \(nums)")

        /* 要素を削除 */
        nums.remove(at: 3)
        print("インデックス 3 の要素を削除すると、nums = \(nums)")

        /* インデックスでリストを走査 */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* リスト要素を直接走査 */
        count = 0
        for x in nums {
            count += x
        }

        /* 2 つのリストを連結する */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("リスト nums1 を nums の後ろに連結すると、nums = \(nums)")

        /* リストをソート */
        nums.sort()
        print("リストをソートした後、nums = \(nums)")
    }
}
