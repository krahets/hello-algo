/**
 * File: Vertex.js
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Класс вершины */
class Vertex {
    val;
    constructor(val) {
        this.val = val;
    }

    /* Вход: список значений vals; вернуть список вершин vets */
    static valsToVets(vals) {
        const vets = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* Вход: список вершин vets; вернуть список значений vals */
    static vetsToVals(vets) {
        const vals = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

module.exports = {
    Vertex,
};
