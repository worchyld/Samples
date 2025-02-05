// using cargo to create this
fn main() {
    const SECONDS_IN_MINUTE: u32 = 60;

    // 32-bit unsigned
    let unsigned_val: u32 = 2;
    // 8-bit unsigned
    let int_eight_bit: i8 = -1;

    // floating point
    let floating_point: f32 = 10.9;

    // bools
    let true_of_false: bool = true;

    // char
    let letter: char = 'a';

    println!("{}", unsigned_val);
    println!("{}", int_eight_bit);
    println!("{}", floating_point);
    println!("{}", true_of_false);
    println!("{}", letter);

    println!("{}", SECONDS_IN_MINUTE);
    println!("Hello, world!");
    let x = 4;
    println!("x: {}", x);
    let x = 5;
    println!("x: {}", x);

    // arrays
    let mut arr = [1,2,3,4,5];
    arr[4] = 3;
    println!("{}", arr[4]);

    // if statements
    let food = "bread";

    if food == "cookie" {
        println!("Cookie");
    } else if food == "fruit" {
        println!("fruit");
    } else if food == "bread" {
        println!("bread");
    } else {
        println!("something else");
    } 

    // nested expression
    let number = {
        let x = 3;
        x + 1
    };

    println!("{}", number);

    let result = add(12, 24);
    println!("{}", result;


    // incrementer
    let mut n: u32 = 1;
    n = increment(n);
   println!("{}", n);
}

fn add(x: i32, y: i32) ->  i32 {
    x + y
}

fn increment(n: u32) -> u32 {
    let sum: u32 = n + 1;
    return sum;
}
