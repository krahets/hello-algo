/**
 * File: Vertex.ts
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 顶点类 */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }

    /* 输入值列表 vals ，返回顶点列表 vets */
    public static valsToVets(vals: number[]): Vertex[] {
        const vets: Vertex[] = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 输入顶点列表 vets ，返回值列表 vals */
    public static vetsToVals(vets: Vertex[]): number[] {
        const vals: number[] = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

export { Vertex };
