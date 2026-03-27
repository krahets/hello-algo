/**
 * File: Vertex.ts
 * Created Time: 2023-02-15
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Класс вершины */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }

    /* На вход подается список значений vals, на выходе возвращается список вершин vets */
    public static valsToVets(vals: number[]): Vertex[] {
        const vets: Vertex[] = [];
        for (let i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* На вход подается список вершин vets, на выходе возвращается список значений vals */
    public static vetsToVals(vets: Vertex[]): number[] {
        const vals: number[] = [];
        for (const vet of vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}

export { Vertex };
