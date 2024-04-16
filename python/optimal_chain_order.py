from math import factorial


def make_expression(matrices: str):
    if len(matrices) <= 2:
        return {matrices}

    result = set[str]()

    for idx in range(1, len(matrices)):
        left_part = matrices[:idx]
        right_part = matrices[idx:]

        left_parentheses = make_expression(left_part)
        right_parentheses = make_expression(right_part)

        for left in left_parentheses:
            for right in right_parentheses.copy():
                lf = f"({left})" if len(left) != 1 else left
                rf = f"({right})" if len(right) != 1 else right
                result.add(f"{lf}{rf}")

                if idx != 1:
                    lf = f"({left})" if len(left) != 1 else left
                    result.add(f"{lf}{right}")

                if idx != len(matrices) - 1:
                    rf = f"({right})" if len(right) != 1 else right
                    result.add(f"{left}{rf}")
    return result


def generate_parenthesizations(mxc: int):
    matrices = "".join([chr(i + ord("A")) for i in range(mxc)])
    print(f"Chain multiplication matrices: {matrices}")

    print("\nCombinations for matrix chain multiplication:")
    for mtx in make_expression(matrices):
        print(mtx)


def catalan_number(nom: int):
    return factorial(2 * nom) // (factorial(nom + 1) * factorial(nom))


def optimal_chain_order_main():
    number_of_matrices = int(input("\nEnter matrix count: "))
    possible_parenthesizations = catalan_number(number_of_matrices - 1)
    print(f"Possible parenthesizations: {possible_parenthesizations}")

    generate_parenthesizations(number_of_matrices)


optimal_chain_order_main()
