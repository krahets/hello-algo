/**
 * File: Vertex.swift
 * Created Time: 2023-02-19
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 顶点类 */
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

    /* 输入值列表 vals ，返回顶点列表 vets */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        var vets: [Vertex] = []
        for val in vals {
            vets.append(Vertex(val: val))
        }
        return vets
    }

    /* 输入顶点列表 vets ，返回值列表 vals */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        var vals: [Int] = []
        for vet in vets {
            vals.append(vet.val)
        }
        return vals
    }
}
