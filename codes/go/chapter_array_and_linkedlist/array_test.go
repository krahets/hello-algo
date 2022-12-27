package chapter_array_and_linkedlist

import (
	"reflect"
	"testing"
)

func TestInitArray(t *testing.T) {
	t.Parallel()
	var arr [5]int
	for _, v := range arr {
		if v != 0 {
			t.Fatalf("array init exception")
		}
	}
}

func TestRandomAccess(t *testing.T) {
	t.Parallel()
	min, max := 1, 5
	nums := [5]int{min, 2, 3, 4, max}
	ans := randomAccess(nums)
	if ans < min || ans > max {
		t.Fatalf("Expected range is greater than min: %v and less than max: %v, got ans: %v", min, max, ans)
	}
}

func TestExtend(t *testing.T) {
	t.Parallel()
	nums := [5]int{1, 2, 3, 4, 5}
	newNums := extend(nums)
	if len(newNums) != ExpectSize {
		t.Fatalf("Expected len: %v, got: %v", ExpectSize, len(nums))
	}
}

func TestInsert(t *testing.T) {
	t.Parallel()
	nums := [5]int{1, 2, 3, 4, 5}
	insert(&nums, 5, 0)
	if nums[0] != 5 {
		t.Fatalf("Expected index[0] val: 5, got: %v", nums[0])
	}
}

func TestRemove(t *testing.T) {
	t.Parallel()
	type fields struct {
		index  int
		after  [5]int
		before [5]int
	}

	tests := []struct {
		name   string
		fields fields
	}{
		{
			name: "remove index[0]",
			fields: struct {
				index  int
				after  [5]int
				before [5]int
			}{
				index:  0,
				after:  [5]int{2, 3, 4, 5, 0},
				before: [5]int{1, 2, 3, 4, 5},
			},
		},
		{
			name: "remove end",
			fields: struct {
				index  int
				after  [5]int
				before [5]int
			}{
				index:  4,
				after:  [5]int{1, 2, 3, 4, 0},
				before: [5]int{1, 2, 3, 4, 5},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			v := tt.fields
			remove(&v.before, v.index)
			if !reflect.DeepEqual(v.before, v.after) {
				t.Errorf("remove(&v.before, v.index) = %v, want %v", v.before, v.after)
			}
		})
	}
}

func TestTraverse(t *testing.T) {
	t.Parallel()
	nums := [5]int{1, 2, 3, 4, 5}
	traverse(nums)
}

func TestFind(t *testing.T) {
	t.Parallel()
	type fields struct {
		target int
		nums   [5]int
	}

	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		{
			name: "element exists",
			fields: struct {
				target int
				nums   [5]int
			}{
				target: 1,
				nums:   [5]int{1, 2, 3, 4, 5},
			},
			want: 0,
		},
		{
			name: "element does not exist",
			fields: struct {
				target int
				nums   [5]int
			}{
				target: 6,
				nums:   [5]int{1, 2, 3, 4, 5},
			},
			want: -1,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			v := tt.fields
			if got := find(v.nums, v.target); got != tt.want {
				t.Errorf("find(v.nums, v.target) = %v, want %v", got, tt.want)
			}
		})
	}
}
