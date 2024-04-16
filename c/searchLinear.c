/* Linear Search. */

// standard
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

// local
#include "./_lib.h"

bool linearSearch(const char *givenSequence, const char *searchTerm)
{
    /* Linear Search Function. */
    const int LENGTH_OF_SEARCH_TERM = strlen(searchTerm),
              LENGTH_OF_GIVEN_SEQUENCE = strlen(givenSequence);
    int leftCursor = 0, rightCursor = LENGTH_OF_SEARCH_TERM;
    char *slice = (char *)"";

    while (rightCursor <= LENGTH_OF_GIVEN_SEQUENCE)
    {
        if (strcmp(sliceString(givenSequence, leftCursor, rightCursor), searchTerm) == 0)
        {
            free(slice);
            return true;
        }
        leftCursor += 1;
        rightCursor = leftCursor + LENGTH_OF_SEARCH_TERM;
    }
    free(slice);
    return false;
}

int main()
{
    /* Main. */
    const char *SAMLE_INPUT_SEQUENCE = "This is an example sequence.",
               *SAMLE_INPUT_SEARCH_TERM = "an ex";

    char *inputSequence = input("Sequence: "),
         *inputSearchTerm = input("Search term: ");

    if (strlen(inputSequence) == 0)
        inputSequence = strdup(SAMLE_INPUT_SEQUENCE);

    if (strlen(inputSearchTerm) == 0)
        inputSearchTerm = strdup(SAMLE_INPUT_SEARCH_TERM);

    puts(linearSearch(inputSequence, inputSearchTerm) ? "true" : "false");

    free(inputSequence);
    free(inputSearchTerm);

    return 0;
}
