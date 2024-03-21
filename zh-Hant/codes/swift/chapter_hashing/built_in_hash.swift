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
        print("整數 \(num) 的雜湊值為 \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("布林量 \(bol) 的雜湊值為 \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小數 \(dec) 的雜湊值為 \(hashDec)")

        let str = "Hello 演算法"
        let hashStr = str.hashValue
        print("字串 \(str) 的雜湊值為 \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("陣列 \(arr) 的雜湊值為 \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("節點物件 \(obj) 的雜湊值為 \(hashObj)")
    }
}
