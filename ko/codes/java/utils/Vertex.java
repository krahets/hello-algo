/**
 * File: Vertex.java
 * Created Time: 2023-02-15
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* 정점 클래스 */
public class Vertex {
    public int val;

    public Vertex(int val) {
        this.val = val;
    }

    /* 값 리스트 vals를 받아 정점 리스트 vets를 반환한다. */
    public static Vertex[] valsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.length];
        for (int i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 정점 리스트 vets를 받아 값 리스트 vals를 반환한다. */
    public static List<Integer> vetsToVals(List<Vertex> vets) {
        List<Integer> vals = new ArrayList<>();
        for (Vertex vet : vets) {
            vals.add(vet.val);
        }
        return vals;
    }
}
