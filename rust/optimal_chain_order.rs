/* Chain Order for Matrix Multiplication */

use std::{
    collections::HashSet,
    io::{stdin, stdout, Write},
};

fn _factorial(num: u128) -> u128 {
    (1..=num).product()
}

/// Helper function to recursively generate all possible parenthesization expressions.
fn _make_expression(matrices: &str) -> HashSet<String> {
    if matrices.len() <= 2 {
        return vec![matrices.to_string()].into_iter().collect();
    }

    let mut result = HashSet::<String>::new();

    for idx in 1..matrices.len() {
        let left_part = &matrices[..idx];
        let right_part = &matrices[idx..];

        let left_parentheses = _make_expression(left_part);
        let right_parentheses = _make_expression(right_part);

        for left in left_parentheses {
            for right in right_parentheses.clone() {
                let lf = if (&left).len() != 1 {
                    format!("({})", &left)
                } else {
                    format!("{}", &left)
                };
                let rf = if (&right).len() != 1 {
                    format!("({})", &right)
                } else {
                    format!("{}", &right)
                };
                result.insert(format!("{}{}", lf, rf));

                if idx != 1 {
                    let lf = if (&left).len() != 1 {
                        format!("({})", &left)
                    } else {
                        format!("{}", &left)
                    };
                    result.insert(format!("{}{}", lf, &right));
                }

                if idx != matrices.len() - 1 {
                    let rf = if (&right).len() != 1 {
                        format!("({})", &right)
                    } else {
                        format!("{}", &right)
                    };
                    result.insert(format!("{}{}", &left, rf));
                }
            }
        }
    }

    result
}

/// Prints the parenthesization of matrix chain multiplication for a given number of matrices.
fn generate_parenthesizations(mxc: usize) {
    // String representation of the matrices
    let matrices = (0..mxc)
        .map(|i| (i as u8 + b'A') as char)
        .collect::<String>();

    println!(
        "Chain multiplication matrices: {}",
        matrices
            .chars()
            .map(|c| c.to_string())
            .collect::<Vec<String>>()
            .join("⋅")
    );

    println!("\nCombinations for matrix chain multiplication:");
    for mtx in _make_expression(matrices.as_str()) {
        println!("{}", mtx);
    }
    // println!("{:#?}", _make_expression(matrices.as_str()));
}

/// Accept input string
fn input(message: &str) -> String {
    print!("{}", message);
    stdout().flush().unwrap();
    let mut input_buffer = String::new();
    stdin().read_line(&mut input_buffer).unwrap();
    input_buffer
}

/// Read: https://en.wikipedia.org/wiki/Matrix_chain_multiplication
/// C(n) = (2n)! / (n+1)! * n!
fn catalan_number(nom: u128) -> u128 {
    _factorial(2 * nom) / (_factorial(nom + 1) * _factorial(nom))
}

pub fn optimal_chain_order_main() {
    let number_of_matrices: usize = input("\nEnter matrix count: ")
        .trim()
        .parse()
        .expect(format!("E@{}: Expected a valid integer", line!()).as_str());

    let possible_parenthesizations = catalan_number((number_of_matrices - 1) as u128);

    println!("Possible parenthesizations: {}", possible_parenthesizations);

    generate_parenthesizations(number_of_matrices);

    // println!("Possible parenthesizations:");
    // for parenthesization in possible_parenthesizations {
    //     println!("{}", parenthesization);
    // }

    // let mut matrix_meta_info: Vec<(u32, u32)> = vec![];
    // for mat in 0..number_of_matrices {
    //     println!("{}", format!("\nMatrix {}:", (mat + 1).to_string()));
    //     let number_of_rows: u32 = input("Enter number of rows: ").trim().parse().unwrap();
    //     let number_of_columns: u32 = input("Enter number of columns: ").trim().parse().unwrap();
    //     matrix_meta_info.push((number_of_rows, number_of_columns));
    // }
}
