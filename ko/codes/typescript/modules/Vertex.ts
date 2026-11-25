/**
 * File: Vertex.ts
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 정점 클래스 */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }

    /* 값 리스트 vals를 받아 정점 리스트 vets를 반환한다. */
    public static valsToVets(vals: number[]): Vertex[] {
        const vets: Vertex[] = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 정점 리스트 vets를 받아 값 리스트 vals를 반환한다. */
    public static vetsToVals(vets: Vertex[]): number[] {
        const vals: number[] = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

export { Vertex };
