package main

import (
	"log"
	"runtime"
	"time"
)

func fibonacci(num int) uint64 {
	if num  == 1 {
		return 0
	}
	if num == 2 {
		return 1
	}
	return fibonacci(num - 1) + fibonacci(num - 2)
}

func main() {
	cores := runtime.NumCPU()
	log.Println("number of cores:", cores)

	for i := 1 ; i <= cores ; i++ {
		log.Printf("starting worker #%d\n", i)
		go func() {
		  fibonacci(100000)
		}()
	}
	<-time.After(15*time.Second)
}