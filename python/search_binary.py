"""Binary Search."""


def is_sorted(given_sequence: str, seq_len: int):
    """Check if sequence is sorted."""
    for idx, elm in enumerate(given_sequence):
        if idx == seq_len - 1:
            break
        if elm > given_sequence[idx + 1]:
            return False
    return True


def binary_search(given_sequence: str, search_term: str):
    """Binary Search Function."""
    length_of_search_term = len(search_term)
    length_of_given_sequence = len(given_sequence)
    left_cursor = 0
    right_cursor = length_of_given_sequence

    if not (
        is_sorted(given_sequence, length_of_given_sequence)
        and is_sorted(search_term, length_of_search_term)
    ):
        return False
    if length_of_search_term > length_of_given_sequence:
        return False
    elif length_of_search_term == length_of_given_sequence:
        return search_term == given_sequence

    while right_cursor <= right_cursor:
        # https://blog.research.google/2006/06/extra-extra-read-all-about-it-nearly.html
        mid_cursor_st = left_cursor + ((right_cursor - left_cursor) // 2)
        mid_cursor_en = mid_cursor_st + length_of_search_term
        exSlice = given_sequence[mid_cursor_st:mid_cursor_en]

        if exSlice == search_term:
            return True
        elif exSlice > search_term:
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
