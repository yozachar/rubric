#[ Linear Search. ]#

import std/strutils

proc linearSearch(givenSequence: string, searchTerm: string): bool =
  #[ Linear Search Function. ]#
  let
    lengthOfSearchTerm = searchTerm.len
    lengthOfGivenSequence = givenSequence.len
  var
    leftCursor = 0
    rightCursor = lengthOfSearchTerm

  while rightCursor <= lengthOfGivenSequence:
    if givenSequence[leftCursor..rightCursor-1] == searchTerm:
      return true
    leftCursor += 1
    rightCursor = leftCursor + lengthOfSearchTerm
  return false


proc main(): void =
  #[ Main. ]#
  let
    sampleInputSequence = "This is an example sequence."
    sampleInputSearchTerm = "an ex"

  stdout.write("Sequence: ")
  var inputSequence = stdin.readLine().strip()
  stdout.write("Search term: ")
  var inputSearchTerm = stdin.readLine().strip()

  if inputSequence.len == 0:
    inputSequence = sampleInputSequence
  if inputSearchTerm.len == 0:
    inputSearchTerm = sampleInputSearchTerm

  echo linearSearch(inputSequence, inputSearchTerm)


main()
