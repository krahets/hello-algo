/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* Driver Code */
    static func main() {
        // [region]{builtin_hash}
        let num = 3
        let hashNum = num.hashValue
        print("整數 \(num) 的雜湊值為 \(hashNum)")
        // 整數 3 的雜湊值為 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("布林量 \(bol) 的雜湊值為 \(hashBol)")
        // 布林量 true 的雜湊值為 -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小數 \(dec) 的雜湊值為 \(hashDec)")
        // 小數 3.14159 的雜湊值為 -2465384235396674631

        let str = "Hello 演算法"
        let hashStr = str.hashValue
        print("字串“\(str)”的雜湊值為 \(hashStr)")
        // 字串“Hello 演算法”的雜湊值為 -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashArr = arr.hashValue
        print("陣列 \(arr) 的雜湊值為 \(hashArr)")
        // 陣列 [AnyHashable(12836), AnyHashable("小哈")] 的雜湊值為 -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("節點物件 \(obj) 的雜湊值為 \(hashObj)")
        // 節點物件 utils.ListNode 的雜湊值為 -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
