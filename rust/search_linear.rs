/* Linear Search. */

use std::io;
use std::io::Write; // brings .flush() into namespace

fn _linear_search(given_sequence: String, search_term: String) -> bool {
    /* Linear Search Function. */
    let length_of_search_term = search_term.chars().count();
    let length_of_given_sequence = given_sequence.chars().count();
    let mut left_cursor = 0;
    let mut right_cursor = length_of_search_term;

    while right_cursor <= length_of_given_sequence {
        if given_sequence[left_cursor..right_cursor].to_string() == search_term {
            return true;
        }
        left_cursor += 1;
        right_cursor = left_cursor + length_of_search_term;
    }
    return false;
}

pub fn search_linear_main() {
    /* Main. */
    let sample_input_sequence = String::from("This is an example sequence.");
    let sample_input_search_term = String::from("an ex");

    print!("Sequence: ");
    io::stdout().flush().unwrap();
    let mut input_sequence = String::new();
    io::stdin()
        .read_line(&mut input_sequence)
        .expect("Failed to read line");
    input_sequence = input_sequence.trim().to_string();
    print!("Search term: ");
    io::stdout().flush().unwrap();
    let mut input_search_term = String::new();
    io::stdin()
        .read_line(&mut input_search_term)
        .expect("Failed to read line");
    input_search_term = input_search_term.trim().to_string();

    if input_sequence.chars().count() == 0 {
        input_sequence = sample_input_sequence;
    }
    if input_search_term.chars().count() == 0 {
        input_search_term = sample_input_search_term;
    }
    println!("{}", _linear_search(input_sequence, input_search_term));
}
