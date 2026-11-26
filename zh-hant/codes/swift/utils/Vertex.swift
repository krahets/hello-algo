/**
 * File: Vertex.swift
 * Created Time: 2023-02-19
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 頂點類別 */
public class Vertex: Hashable {
    public var val: Int

    public init(val: Int) {
        self.val = val
    }

    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        lhs.val == rhs.val
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }

    /* 傳入數值陣列 vals，回傳頂點陣列 vets */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        vals.map { Vertex(val: $0) }
    }

    /* 傳入頂點陣列 vets，回傳數值陣列 vals */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        vets.map { $0.val }
    }
}
