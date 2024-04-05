/**
 * File: Pair.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 鍵值對 */
public class Pair: Equatable {
    public var key: Int
    public var val: String

    public init(key: Int, val: String) {
        self.key = key
        self.val = val
    }

    public static func == (lhs: Pair, rhs: Pair) -> Bool {
        lhs.key == rhs.key && lhs.val == rhs.val
    }
}
