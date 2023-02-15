/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com), krahets (krahets@163.com)
 */

namespace hello_algo.include;

/* 顶点类 */
public class Vertex
{
    public int Val { get; init; }
    public Vertex(int val)
    {
        Val = val;
    }

    /* 输入值列表 vals ，返回顶点列表 vets */
    public static Vertex[] valsToVets(int[] vals)
    {
        Vertex[] vets = new Vertex[vals.Length];
        for (int i = 0; i < vals.Length; i++)
        {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 输入顶点列表 vets ，返回值列表 vals */
    public static List<int> vetsToVals(List<Vertex> vets)
    {
        List<int> vals = new List<int>();
        foreach (Vertex vet in vets)
        {
            vals.Add(vet.Val);
        }
        return vals;
    }
}
