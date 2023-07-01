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
        let num = 3
        let hashNum = num.hashValue
        print("整数 \(num) 的哈希值为 \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("布尔量 \(bol) 的哈希值为 \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小数 \(dec) 的哈希值为 \(hashDec)")

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("字符串 \(str) 的哈希值为 \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("数组 \(arr) 的哈希值为 \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("节点对象 \(obj) 的哈希值为 \(hashObj)")
    }
}
