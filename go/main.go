package main

import (
	"fmt"
	"syscall/js"
)

func add(this js.Value, args []js.Value) interface{} {
	if len(args) != 2 {
		return nil
	}

	a := args[0].Int()
	b := args[1].Int()
	result := a + b

	return result
}

func registerCallback() {
	js.Global().Set("add", js.FuncOf(add))
}

func main() {

	fmt.Println("Go Wasm module initialized.")
	registerCallback()
	// Wait for JavaScript calls.
	select {}
}
