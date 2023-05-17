package chapter_graph

import (
	"reflect"
	"sort"

	. "github.com/krahets/hello-algo/pkg"
)

// graph 比较， 检查是否是同一个图
func isSameGraph(g1, g2 *graphAdjList) bool {
	if g1 == nil || g2 == nil || len(g1.adjList) != len(g2.adjList) {
		return false
	}
	var keys []Vertex
	for k, values := range g1.adjList {
		keys = append(keys, k)
		sort.Slice(values, func(i, j int) bool {
			return values[i].Val < values[j].Val
		})
	}
	for _, k := range keys {
		list1 := g1.adjList[k]
		list2, ok := g2.adjList[k]
		if !ok {
			return false
		}
		sort.Slice(list2, func(i, j int) bool {
			return list2[i].Val < list2[j].Val
		})
		if !reflect.DeepEqual(list1, list2) {
			return false
		}

	}
	return true
}
