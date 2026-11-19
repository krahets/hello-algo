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
        print("整数 \(num) 的哈希值为 \(hashNum)")
        // 整数 3 的哈希值为 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("布尔量 \(bol) 的哈希值为 \(hashBol)")
        // 布尔量 true 的哈希值为 -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小数 \(dec) 的哈希值为 \(hashDec)")
        // 小数 3.14159 的哈希值为 -2465384235396674631

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("字符串“\(str)”的哈希值为 \(hashStr)")
        // 字符串“Hello 算法”的哈希值为 -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashArr = arr.hashValue
        print("数组 \(arr) 的哈希值为 \(hashArr)")
        // 数组 [AnyHashable(12836), AnyHashable("小哈")] 的哈希值为 -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("节点对象 \(obj) 的哈希值为 \(hashObj)")
        // 节点对象 utils.ListNode 的哈希值为 -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
