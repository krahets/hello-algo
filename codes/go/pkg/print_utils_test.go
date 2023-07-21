package pkg

import (
	"container/list"
	"testing"
)

func TestPrintList(t *testing.T) {
	list1 := list.New()
	list1.PushBack(1)
	list2 := list.New()
	PrintList(list1)
	PrintList(list2)
}
