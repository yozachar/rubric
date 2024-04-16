package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func linearSearch(givenSequence string, searchTerm string) bool {
	/* Linear Search Function. */
	lengthOfSearchTerm := len(searchTerm)
	lengthOfGivenSequence := len(givenSequence)
	leftCursor := 0
	rightCursor := lengthOfSearchTerm

	for rightCursor <= lengthOfGivenSequence {
		if givenSequence[leftCursor:rightCursor] == searchTerm {
			return true
		}
		leftCursor += 1
		rightCursor = leftCursor + lengthOfSearchTerm
	}
	return false
}

func main() {
	/* Main. */
	sampleInputSequence := "This is an example sequence."
	sampleInputSearchTerm := "an ex"

	inputReader := bufio.NewReader(os.Stdin)
	fmt.Print("Sequence: ")
	inputSequence, _ := inputReader.ReadString('\n')
	inputSequence = strings.TrimSpace(inputSequence)
	fmt.Print("Search term: ")
	inputSearchTerm, _ := inputReader.ReadString('\n')
	inputSearchTerm = strings.TrimSpace(inputSearchTerm)

	if len(inputSequence) == 0 {
		inputSequence = sampleInputSequence
	}
	if len(inputSearchTerm) == 0 {
		inputSearchTerm = sampleInputSearchTerm
	}

	result := linearSearch(inputSequence, inputSearchTerm)
	fmt.Println(result)
}
