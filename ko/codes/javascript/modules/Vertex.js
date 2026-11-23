/**
 * File: Vertex.js
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 정점 클래스 */
class Vertex {
    val;
    constructor(val) {
        this.val = val;
    }

    /* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
    static valsToVets(vals) {
        const vets = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
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
