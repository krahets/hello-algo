/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 実行用コード */
fun main() {
    // [region]{init_list}
    /* リストを初期化する */
    // 初期値なし
    val emptyNums = mutableListOf<Int>()
    // 初期値あり
    val nums = mutableListOf(1, 3, 2, 5, 4)
    // [endregion]{init_list}
    println("リスト nums = $nums")
    println("リスト emptyNums = $emptyNums")

    // [region]{access_element}
    /* 要素にアクセスする */
    val num = nums[1] // インデックス 1 の要素にアクセスする
    // [endregion]{access_element}
    println("インデックス 1 の要素にアクセスした結果 num = $num")

    // [region]{update_element}
    /* 要素を更新する */
    nums[1] = 0 // インデックス 1 の要素を 0 に更新する
    // [endregion]{update_element}
    println("インデックス 1 の要素を 0 に更新した結果 nums = $nums")

    // [region]{clear_list}
    /* リストを空にする */
    nums.clear()
    // [endregion]{clear_list}
    println("リストを空にした後 nums = $nums")

    // [region]{append_element}
    /* 末尾に要素を追加する */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    // [endregion]{append_element}
    println("要素を追加した後 nums = $nums")

    // [region]{insert_element}
    /* 途中に要素を挿入する */
    nums.add(3, 6) // インデックス 3 に数値 6 を挿入する
    // [endregion]{insert_element}
    println("インデックス 3 に数値 6 を挿入した結果 nums = $nums")

    // [region]{remove_element}
    /* 要素を削除する */
    nums.removeAt(3) // インデックス 3 の要素を削除する
    // [endregion]{remove_element}
    println("インデックス 3 の要素を削除した結果 nums = $nums")

    // [region]{iterate_list}
    /* インデックスを使ってリストを走査する */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* リストの要素を直接走査する */
    for (j in nums) {
        count += j
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* 2 つのリストを連結する */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // リスト nums の後ろに nums1 を連結する
    // [endregion]{concat_list}
    println("リスト nums の後ろに nums1 を連結した結果 nums = $nums")

    // [region]{sort_list}
    /* リストをソートする */
    nums.sort() // ソート後、リストの要素は昇順に並ぶ
    // [endregion]{sort_list}
    println("リストをソートした後 nums = $nums")
}