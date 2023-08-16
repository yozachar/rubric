#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Function to create a slice of a C string
char *sliceString(const char *str, size_t start, size_t end)
{
    size_t length = end - start;

    if (length <= 0)
    {
        return (char *)""; // Return NULL for empty or invalid slices
    }

    char *newSlice = (char *)malloc((length + 1) * sizeof(char)); // +1 for null terminator
    if (newSlice == NULL)
    {
        return (char *)""; // Memory allocation failed
    }

    strncpy(newSlice, str + start, length);
    newSlice[length] = '\0'; // Add null terminator

    return newSlice;
}

char *trimWhiteSpaces(char *str)
{
    char *end;
    while (isspace(*str))
        str++;
    if (*str == 0)
        return str;
    end = str + strlen(str) - 1;
    while (end > str && isspace(*end))
        end--;
    end[1] = '\0';

    return str;
}

char *input(const char *prompt)
{
    char *buffer = NULL;
    size_t buffer_size = 0;

    printf("%s", prompt);
    getline(&buffer, &buffer_size, stdin);

    return trimWhiteSpaces(buffer);
}
