import 'dart:convert';
import "dart:io";

bool linearSearch(String givenSequence, String searchTerm) {
  /* Linear Search Function. */
  final lengthOfSearchTerm = searchTerm.length;
  final lengthOfGivenSequence = givenSequence.length;
  var leftCursor = 0;
  var rightCursor = lengthOfSearchTerm;

  while (rightCursor <= lengthOfGivenSequence) {
    if (givenSequence.substring(leftCursor, rightCursor) == searchTerm) {
      return true;
    }
    leftCursor += 1;
    rightCursor = leftCursor + lengthOfSearchTerm;
  }
  return false;
}

void main() {
  /* Main. */
  const SAMPLE_INPUT_SEQUENCE = "This is an example sequence.";
  const SAMPLE_INPUT_SEARCH_TERM = "an ex";

  stdout.write("Sequence: ");
  var inputSequence = (stdin.readLineSync(encoding: utf8))?.trim();
  stdout.write("Search term: ");
  var inputSearchTerm = (stdin.readLineSync(encoding: utf8))?.trim();

  if (inputSequence == null || inputSequence.length == 0) {
    inputSequence = SAMPLE_INPUT_SEQUENCE;
  }
  if (inputSearchTerm == null || inputSearchTerm.length == 0) {
    inputSearchTerm = SAMPLE_INPUT_SEARCH_TERM;
  }

  print(linearSearch(inputSequence, inputSearchTerm));
}
