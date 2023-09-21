package main

import (
	"fmt"
	"math"
)

const V = 6

func minDistance(dist []int, sptSet []bool) int {
	minDist := math.MaxInt32
	minIndex := -1

	for v := 0; v < V; v++ {
		if !sptSet[v] && dist[v] <= minDist {
			minDist = dist[v]
			minIndex = v
		}
	}

	return minIndex
}

func printSolution(dist []int) {
	fmt.Println("顶点   距离")
	for i := 0; i < V; i++ {
		fmt.Printf("%d     %d\n", i, dist[i])
	}
}

func dijkstra(graph [][]int, src int) {
	dist := make([]int, V)
	sptSet := make([]bool, V)

	for i := 0; i < V; i++ {
		dist[i] = math.MaxInt32
		sptSet[i] = false
	}

	dist[src] = 0

	for count := 0; count < V-1; count++ {
		u := minDistance(dist, sptSet)
		sptSet[u] = true

		for v := 0; v < V; v++ {
			if !sptSet[v] && graph[u][v] != 0 && dist[u] != math.MaxInt32 &&
				dist[u]+graph[u][v] < dist[v] {
				dist[v] = dist[u] + graph[u][v]
			}
		}
	}

	printSolution(dist)
}

func main() {
	graph := [][]int{
		{0, 2, 0, 6, 0, 0},
		{2, 0, 3, 8, 5, 0},
		{0, 3, 0, 0, 7, 0},
		{6, 8, 0, 0, 9, 10},
		{0, 5, 7, 9, 0, 1},
		{0, 0, 0, 10, 1, 0},
	}

	dijkstra(graph, 0)
}
