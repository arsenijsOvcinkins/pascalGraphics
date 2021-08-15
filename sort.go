package main

import (
	"fmt"
	"math/rand"
	"time"

	"github.com/nsf/termbox-go"
)

const frameRate = 1000000

var x, y int

func main() {
	err := termbox.Init()
	if err != nil {
		panic(err)
	}
	defer termbox.Close()
	termbox.Clear(termbox.ColorDefault, termbox.ColorDefault)
	x, y = 1, 1
	frame := frameRate
	count := 2
	list := generate(count)
	now := time.Now()
	rand.Seed(time.Now().UnixNano())
	var attempt uint64 = 0
	for {
		attempt++
		rand.Shuffle(len(list), func(i, j int) { list[i], list[j] = list[j], list[i] })
		frame--
		if isSorted(list) {
			out("%v of %d elements. Attempt: %d. Finished in: %v\n", []interface{}{list, count, attempt, time.Now().Sub(now)})
			count++
			list = generate(count)
			attempt = 0
			y++
			frame = frameRate
			now = time.Now()
			continue
		}
		if frame == 0 {
			out("%v of %d elements. Attempt: %d. Time: %v.\n", []interface{}{list, count, attempt, time.Now().Sub(now)})
			frame = frameRate
		}
	}
}

func generate(count int) []int {
	rand.Seed(time.Now().UnixNano())
	list := []int{}
	for i := 0; i < count; i++ {
		list = append(list, rand.Intn(100)-50)
	}

	return list
}

func out(s string, args []interface{}) {
	termbox.SetCursor(x, y)
	termbox.Flush()
	fmt.Printf(s, args...)
}

func isSorted(list []int) bool {
	for i := 0; i < len(list)-1; i++ {
		if list[i] > list[i+1] {
			return false
		}
	}

	return true
}
