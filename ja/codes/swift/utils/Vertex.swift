/**
 * File: Vertex.swift
 * Created Time: 2023-02-19
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 頂点クラス */
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

    /* 値リスト vals を入力し、頂点リスト vets を返す */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        vals.map { Vertex(val: $0) }
    }

    /* 頂点リスト vets を入力し、値リスト vals を返す */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        vets.map { $0.val }
    }
}
