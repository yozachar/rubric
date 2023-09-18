/* Linear Search. */

import * as readline from "node:readline/promises";
import { stdin as input, stdout as output } from "node:process";

function linearSearch(givenSequence: string, searchTerm: string) {
  /* Linear Search Function */
  const lengthOfSearchTerm = searchTerm.length,
    lengthOfGivenSequence = givenSequence.length;
  let leftCursor = 0,
    rightCursor = lengthOfSearchTerm;

  while (rightCursor <= lengthOfGivenSequence) {
    if (givenSequence.slice(leftCursor, rightCursor) == searchTerm) return true;
    leftCursor += 1;
    rightCursor = leftCursor + lengthOfSearchTerm;
  }
  return false;
}

async function main() {
  /* Main. */
  const sampleInputSequence = "This is an example sequence.",
    sampleInputSearchTerm = "an ex";

  const rl = readline.createInterface({ input, output });

  let inputSequence = (await rl.question("Sequence: ")).trim();
  let inputSearchTerm = (await rl.question("Search term: ")).trim();

  if (inputSequence.length == 0) inputSequence = sampleInputSequence;
  if (inputSearchTerm.length == 0) inputSearchTerm = sampleInputSearchTerm;

  rl.close();

  console.log(linearSearch(inputSequence, inputSearchTerm));
}

main();
