package main

import "fmt"

type person struct {
	name string
	age int
}

func main() {
	fmt.Println("hello world")

	// Simple addition
	// Uses shorthand for variables
	x := 5
	y := 7
	sum := x + y

	fmt.Println(sum)

	if sum > 10 {
		fmt.Println("More than 10")
	}

	// Arrays
	var someArray[5]int 
	someArray[2] = 7 // set position to be 7
	fmt.Println(someArray)

	// Shorthand array
	anotherArray := []int {5,4,3,2,1}
	
	// Append
	anotherArray = append(anotherArray,13)
	fmt.Println(anotherArray)

	// Dictionaries
	myFirstDictionary := make(map[string]int)
	myFirstDictionary["triangle"] = 2
	myFirstDictionary["square"] = 3

	// Delete from dictionary
	delete(myFirstDictionary, "square")

	fmt.Println(myFirstDictionary)	
	fmt.Println(myFirstDictionary["triangle"])

	// For loop
	for i:=0; i<5; i++ {
		fmt.Println(i)
	}

	// For loop with a range
	for index, value := range anotherArray {
		fmt.Println("index: ", index, "value: ", value)
	}

	// Map
	m:= make(map[string] string)
	m["a"] = "alpha"
	m["b"] = "beta"

	for key, value := range m {
		fmt.Println("key: ", key, " value: ", value)
	}

	// Create and output a struct
	p := person{name: "Jake", age: 23}
	fmt.Println(p)
	fmt.Println(p.age)

	// Pointers
}