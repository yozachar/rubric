package dev.jcube.rubric

fun linearSearch(givenSequence: String, searchTerm: String): Boolean {
    val lengthOfSearchTerm = searchTerm.length
    val lengthOfGivenSequence = givenSequence.length
    var leftCursor = 0
    var rightCursor = lengthOfSearchTerm

    while (rightCursor <= lengthOfGivenSequence) {
        if (givenSequence.slice(leftCursor until rightCursor) == searchTerm) {
            return true
        }
        leftCursor += 1
        rightCursor = leftCursor + lengthOfSearchTerm
    }
    return false
}

fun main() {
    val sampleInputSequence = "This is an example sequence."
    val sampleInputSearchTerm = "an ex"

    print("Sequence: ")
    var inputSequence = readLine()?.toString() ?: ""
    print("Search term: ")
    var inputSearchTerm = readLine()?.toString() ?: ""

    if (inputSequence.length == 0) {
        inputSequence = sampleInputSequence
    }
    if (inputSearchTerm.length == 0) {
        inputSearchTerm = sampleInputSearchTerm
    }

    println(linearSearch(inputSequence, inputSearchTerm))
}
