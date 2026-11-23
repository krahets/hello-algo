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

    /* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
    public static Vertex[] valsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.length];
        for (int i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
    public static List<Integer> vetsToVals(List<Vertex> vets) {
        List<Integer> vals = new ArrayList<>();
        for (Vertex vet : vets) {
            vals.add(vet.val);
        }
        return vals;
    }
}
