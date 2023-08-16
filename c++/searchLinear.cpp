/* Linear Search. */

#include <iostream>
#include <string>

bool linearSearch(std::string givenSequence, std::string searchTerm)
{
    /* Linear Search Function. */
    const int LENGTH_OF_SEARCH_TERM = searchTerm.length(),
              LENGTH_OF_GIVEN_SEQUENCE = givenSequence.length();
    int leftCursor = 0, rightCursor = LENGTH_OF_SEARCH_TERM;

    while (rightCursor <= LENGTH_OF_GIVEN_SEQUENCE)
    {

        std::string slice = givenSequence.substr(leftCursor, LENGTH_OF_SEARCH_TERM);
        std::cout << leftCursor << " " << slice << " " << rightCursor << "\n";
        if (slice.compare(searchTerm) == 0)
            return true;
        leftCursor += 1;
        rightCursor = leftCursor + LENGTH_OF_SEARCH_TERM;
    }

    return false;
}

int main()
{
    /* Main. */
    const std::string SAMLE_INPUT_SEQUENCE = "This is an example sequence.",
                      SAMLE_INPUT_SEARCH_TERM = "an ex";

    std::string inputSequence = "", inputSearchTerm = "";
    std::cout << "Sequence: ";
    std::getline(std::cin, inputSequence);
    std::cout << "Search term: ";
    std::getline(std::cin, inputSearchTerm);

    if (inputSequence.length() == 0)
        inputSequence = SAMLE_INPUT_SEQUENCE;
    if (inputSearchTerm.length() == 0)
        inputSearchTerm = SAMLE_INPUT_SEARCH_TERM;

    std::cout << (linearSearch(inputSequence, inputSearchTerm) ? "true" : "false") << "\n";

    return 0;
}
