"""Binary Search."""

# Requires Array Sorting with proper Comparator

def binary_search(given_sequence: str, search_term: str):
    """Binary Search Function."""
    length_of_search_term = len(search_term)
    length_of_given_sequence = len(given_sequence)
    left_cursor = 0
    right_cursor = length_of_given_sequence


    while right_cursor <= right_cursor:
        mid_cursor = (right_cursor - left_cursor) // 2
        if given_sequence[mid_cursor:mid_cursor+length_of_search_term] == search_term:
            return True
        left_cursor += 1
        right_cursor = left_cursor + length_of_search_term
    return False

def main():
    """Main."""
    sample_input_sequence = "This is an example sequence."
    sample_input_search_term = "an ex"

    input_sequence = input("Sequence: ") or sample_input_sequence
    input_search_term = input("Search term: ") or sample_input_search_term

    print(binary_search(input_sequence, input_search_term))


main()
