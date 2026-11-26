/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* Driver code */
    static func main() {
        let num = 3
        let hashNum = num.hashValue
        print("Integer \(num) has hash value \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Boolean \(bol) has hash value \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Floating-point number \(dec) has hash value \(hashDec)")

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("String \(str) has hash value \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("Array \(arr) has hash value \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Node object \(obj) has hash value \(hashObj)")
    }
}
