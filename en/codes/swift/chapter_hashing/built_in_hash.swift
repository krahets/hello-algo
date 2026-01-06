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
        print("Hash value of integer \(num) is \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Hash value of boolean \(bol) is \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Hash value of decimal \(dec) is \(hashDec)")

        let str = "Hello Algo"
        let hashStr = str.hashValue
        print("Hash value of string \(str) is \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("Xiao Ha")]
        let hashTup = arr.hashValue
        print("Hash value of array \(arr) is \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Hash value of node object \(obj) is \(hashObj)")
    }
}
