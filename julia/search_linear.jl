function linearSearch(givenSequnce::String, searchTerm::String)
    #= Linear Search Function. =#
    lengthOfSearchTem = length(searchTerm)
    lenghtOfGivenSequnce = length(givenSequnce)
    leftCursor = 1
    rightCursor = lengthOfSearchTem
    while rightCursor <= lenghtOfGivenSequnce
        if SubString(givenSequnce, leftCursor, rightCursor - 1) == searchTerm
            return true
        end
        leftCursor += 1
        rightCursor = leftCursor + lengthOfSearchTem
    end
    return false
end

function main()
    #= Main. =#
    SAMPLE_INPUT_SEQUENCE = "This is an example sequence."
    SAMPLE_INPUT_SEARCH_TERM = "an ex"

    print("Sequnce: ")
    inputSequence = strip(readline())
    print("Search term: ")
    inputSearchTerm = strip(readline())

    if inputSequence == ""
        inputSequence = SAMPLE_INPUT_SEQUENCE
    end
    if inputSearchTerm == ""
        inputSearchTerm = SAMPLE_INPUT_SEARCH_TERM
    end

    println(linearSearch(inputSequence, inputSearchTerm))

end

main()
