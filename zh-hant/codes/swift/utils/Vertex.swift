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

    /* 輸入值串列 vals ，返回頂點串列 vets */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        vals.map { Vertex(val: $0) }
    }

    /* 輸入頂點串列 vets ，返回值串列 vals */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        vets.map { $0.val }
    }
}
