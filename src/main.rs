// #[path = "../rust/search_linear.rs"] // this is a bad idea!
// mod search_linear;

#[path = "../rust/optimal_chain_order.rs"]
mod optimal_chain_order;

use crate::optimal_chain_order::optimal_chain_order_main;
// use crate::search_linear::search_linear_main;

fn main() {
    // search_linear_main();
    optimal_chain_order_main();
}
