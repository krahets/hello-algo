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
        print("Hash value of integer \(num): \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Hash value of Boolean \(bol): \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Hash value of floating-point number \(dec): \(hashDec)")

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("Hash value of string \(str): \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("Hash value of array \(arr): \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Hash value of node object \(obj): \(hashObj)")
    }
}
