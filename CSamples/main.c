//
//  main.c
//  CSamples
//
//  Created by Amarjit on 29/04/2024.
//

#include <stdio.h>
#include <stdbool.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    printf("This sentence will work!\n");
    printf("And it is awesome!\n");
    
    // multi-line
    printf("Hello World!\nI am learning C.\nAnd it is awesome!\n");
    printf("first\tsecond\\backslash\n");
    
    // variables
    int myNum = 15;             // Integer
    float myFloatNum = 5.99;   // Floating point number
    char myLetter = 'D';       // Character
    
    printf("%d\n", myNum);
    printf("%f\n", myFloatNum);
    printf("%c\n", myLetter);
    
    int myOtherNum = 23;

    // Assign myOtherNum (23) to myNum
    myNum = myOtherNum;
    printf("%d\n", myNum);
    
    // Add numbers together
    int x = 5;
    int y = 6;
    int sum = x + y;
    printf("%d\n", sum);
    
    // Declaring multiple vars
    int x1 = 5, y1 = 6, z1 = 50;
    printf("%d\n", x1 + y1 + z1);
    
    
    // Create integer variables
    int length = 4;
    int width = 6;
    int area;

    // Calculate the area of a rectangle
    area = length * width;

    // Print the variables
    printf("Length is: %d\n", length);
    printf("Width is: %d\n", width);
    printf("Area of the rectangle is: %d\n", area);
 
    // Print ASCII chars
    char a = 65, b = 66, c = 67;
    printf("%c\n", a);
    printf("%c\n", b);
    printf("%c\n", c);
    
    // Decimal precision
    float myFloatNumber = 3.5;
    double myDoubleNumber = 19.99;

    printf("%f\n", myFloatNumber); // Outputs 3.500000
    printf("%f\n", myDoubleNumber); // Outputs 19.990000
    
    printf("%.2f\n", myFloatNumber); // Only show 2 digits
    
    const int myNumberConst = 15;  // constant
    printf("%d\n", myNumberConst);
    
    int total = 100 + 50;
    printf("%d\n", total);
    
    bool isProgrammingFun = true;
    bool isFishTasty = false;
    
    // Return boolean values
    printf("%d\n", isProgrammingFun);   // Returns 1 (true)
    printf("%d\n", isFishTasty);        // Returns 0 (false)
    
    int myAge = 25;
    int votingAge = 18;

    printf("%d\n", myAge >= votingAge); // Returns 1 (true), meaning 25 year olds are allowed to vote!
    
    return 0;
}
