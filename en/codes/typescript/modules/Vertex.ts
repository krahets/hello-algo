/**
 * File: Vertex.ts
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Vertex class */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }

    /* Input value list vals, return vertex list vets */
    public static valsToVets(vals: number[]): Vertex[] {
        const vets: Vertex[] = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* Input vertex list vets, return value list vals */
    public static vetsToVals(vets: Vertex[]): number[] {
        const vals: number[] = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

export { Vertex };
