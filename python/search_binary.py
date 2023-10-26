"""Binary Search."""


def binary_search(given_sequence: str, search_term: str):
    """Binary Search Function."""
    length_of_search_term = len(search_term)
    length_of_given_sequence = len(given_sequence)
    left_cursor = 0
    right_cursor = length_of_given_sequence

    if length_of_search_term > length_of_given_sequence:
        return False
    elif length_of_search_term == length_of_given_sequence:
        return search_term == given_sequence

    while right_cursor <= right_cursor:
        mid_cursor_st = (right_cursor - left_cursor) // 2
        mid_cursor_en = mid_cursor_st + length_of_search_term
        exSlice = given_sequence[mid_cursor_st:mid_cursor_en]

        if exSlice == search_term:
            return True
        elif exSlice[0] > search_term[0]:
            right_cursor = mid_cursor_st
        else:
            left_cursor = mid_cursor_st
    return False


def main():
    """Main."""
    sample_input_sequence = "    .Taaceeeeehiilmnnpqsssux"
    sample_input_search_term = " .Ta"

    input_sequence = input("Sequence: ") or sample_input_sequence
    input_search_term = input("Search term: ") or sample_input_search_term

    print(binary_search(input_sequence, input_search_term))


main()
