module main

import os


fn linear_search(given_sequence string, search_term string) bool {
	/* Linear Search Function. */
	length_of_search_term := search_term.len
    length_of_given_sequence := given_sequence.len
	mut left_cursor := 0
	mut right_cursor := length_of_search_term
	for right_cursor <= length_of_given_sequence {
        if given_sequence[left_cursor..right_cursor] == search_term {
            return true
		}
        left_cursor += 1
        right_cursor = left_cursor + length_of_search_term
	}
	return false
}

fn main() {
	/* Main. */
	sample_input_sequence := "This is an example sequence."
    sample_input_search_term := "an ex"

    mut input_sequence := os.input("Sequence: ")
    mut input_search_term := os.input("Search term: ")

	if input_sequence.len == 0 {
		input_sequence = sample_input_sequence
	}
	if input_search_term.len == 0 {
		input_search_term = sample_input_search_term
	}

    println(linear_search(input_sequence, input_search_term))
}
