"""Linear Search."""


def linear_search(given_sequence: str, search_term: str):
    """Linear Search Function."""
    length_of_search_term = len(search_term)
    length_of_given_sequence = len(given_sequence)
    left_cursor = 0
    right_cursor = length_of_search_term

    while right_cursor <= length_of_given_sequence:
        if given_sequence[left_cursor:right_cursor] == search_term:
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

    print(linear_search(input_sequence, input_search_term))


main()
