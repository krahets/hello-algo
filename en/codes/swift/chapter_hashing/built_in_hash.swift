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
        print("The hash value of integer \(num) = \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("The hash value of boolean \(bol) = \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("The hash value of decimal \(dec) = \(hashDec)")

        let str = "Hello algorithm"
        let hashStr = str.hashValue
        print("The hash value of string \(str) = \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("Ha")]
        let hashTup = arr.hashValue
        print("The hash value of array \(arr) = \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("The hash value of node object \(obj) = \(hashObj)")
    }
}
