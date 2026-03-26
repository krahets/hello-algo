/**
 * File: Vertex.swift
 * Created Time: 2023-02-19
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс вершины */
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

    /* Вход: список значений vals; вернуть список вершин vets */
    public static func valsToVets(vals: [Int]) -> [Vertex] {
        vals.map { Vertex(val: $0) }
    }

    /* Вход: список вершин vets; вернуть список значений vals */
    public static func vetsToVals(vets: [Vertex]) -> [Int] {
        vets.map { $0.val }
    }
}
