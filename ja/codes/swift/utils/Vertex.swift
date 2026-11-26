/**
 * File: Vertex.swift
 * Created Time: 2023-02-19
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 頂点を表すクラス */
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

    /* 値のリスト vals を受け取り、頂点のリスト vets を返す */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        vals.map { Vertex(val: $0) }
    }

    /* 頂点のリスト vets を受け取り、値のリスト vals を返す */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        vets.map { $0.val }
    }
}
