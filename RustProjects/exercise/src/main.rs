/* Learning rust
@URL: https://google.github.io/comprehensive-rust/welcome.html
@Date: May 2023 */

fn main() {
    let mut x: i32 = 6;
    print!("{x}");
    while x != 1 {
        if x % 2 == 0 {
            x = x / 2;
        } else {
            x = 3 * x + 1;
        }
        print!(" -> {x}");
    }
    println!("\n");

    // Array assignment example
    let mut a: [i8; 10] = [42; 10];
    a[5] = 0;
    println!("a: {:?}", a);

    // Tuple assignment 
    let t: (i8, bool) = (7, true);
    println!("1st index: {}", t.0);
    println!("2nd index: {}", t.1);

    // Overloading -- not supported, but we can do generics?
    println!("coin toss: {}", pick_one("heads", "tails"));
    println!("cash prize: {}", pick_one(500, 1000));

    // Day #1 -- Implicit conversions

    let x: i16 = 15;
    let y: i16 = 1000;
    println!("{x} * {y} = {}", multiply(x,y) );

    // Arrays and for loops
    let array = [10,20,30];
    println!("array: {array:?}");

    // Iterate over array
    for n in array {
        print!("{n}" );
    }
    println!();

    print!("Iterating over range");
    for i in 0..3 {
        print!(" {}", array[i]);
    }
    println!();
}

fn pick_one<T>(a: T, b: T) -> T {
    if std::process::id() % 2 == 0 { a } else { b }
}

fn multiply(x: i16, y: i16) -> i16 {
    return x * y
}

