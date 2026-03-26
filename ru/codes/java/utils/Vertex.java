/**
 * File: Vertex.java
 * Created Time: 2023-02-15
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* Класс вершины */
public class Vertex {
    public int val;

    public Vertex(int val) {
        this.val = val;
    }

    /* Входзначениесписок vals, Вернутьсписок вершин vets */
    public static Vertex[] valsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.length];
        for (int i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* Входсписок вершин vets, Вернутьзначениесписок vals */
    public static List<Integer> vetsToVals(List<Vertex> vets) {
        List<Integer> vals = new ArrayList<>();
        for (Vertex vet : vets) {
            vals.add(vet.val);
        }
        return vals;
    }
}
