/**
 * File: Vertex.ts
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 頂點類別 */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }

    /* 傳入數值陣列 vals，回傳頂點陣列 vets */
    public static valsToVets(vals: number[]): Vertex[] {
        const vets: Vertex[] = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 傳入頂點陣列 vets，回傳數值陣列 vals */
    public static vetsToVals(vets: Vertex[]): number[] {
        const vals: number[] = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

export { Vertex };
