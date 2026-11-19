/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* 実行用コード */
    static func main() {
        // [region]{builtin_hash}
        let num = 3
        let hashNum = num.hashValue
        print("整数 \(num) のハッシュ値は \(hashNum)")
        // 整数 3 のハッシュ値は 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("真偽値 \(bol) のハッシュ値は \(hashBol)")
        // 真偽値 true のハッシュ値は -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("小数 \(dec) のハッシュ値は \(hashDec)")
        // 小数 3.14159 のハッシュ値は -2465384235396674631

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("文字列「\(str)」のハッシュ値は \(hashStr)")
        // 文字列「Hello 算法」のハッシュ値は -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashArr = arr.hashValue
        print("配列 \(arr) のハッシュ値は \(hashArr)")
        // 配列 [AnyHashable(12836), AnyHashable("小哈")] のハッシュ値は -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("ノードオブジェクト \(obj) のハッシュ値は \(hashObj)")
        // ノードオブジェクト utils.ListNode のハッシュ値は -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
