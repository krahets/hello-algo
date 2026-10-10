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
        print("整数 \(num) のハッシュ値は \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("真偽値 \(bol) のハッシュ値は \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小数 \(dec) のハッシュ値は \(hashDec)")

        let str = "Hello アルゴリズム"
        let hashStr = str.hashValue
        print("文字列 \(str) のハッシュ値は \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("シャオハー")]
        let hashTup = arr.hashValue
        print("配列 \(arr) のハッシュ値は \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("ノードオブジェクト \(obj) のハッシュ値は \(hashObj)")
    }
}
