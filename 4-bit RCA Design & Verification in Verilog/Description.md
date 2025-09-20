## My Verilog Project: Building and Breaking a 4-bit Adder
Welcome! This project is a simple dive into digital design where I built a classic 4-bit Ripple Carry Adder (RCA) in Verilog.

The fun part? I made two versions:

One that works perfectly.
One with a single, tiny bug.

The goal is to show how a good testbench can easily catch these kinds of hardware errors.

## So, How Does It Work? ⚙️
At its heart, the adder is just four "Full Adders" chained together. Each one calculates the sum for a single bit and passes the carry-out to the next one in line.

## The Hidden Bug 🐞
To make things interesting, I intentionally broke the code in Design_code_with_errors.v. I swapped a single logical OR (^) for an AND (&) in the sum logic for the second bit.
This tiny typo completely messes up the math for certain numbers, proving how one small mistake can cause big problems!

## The Detective: Our Testbench 🧪
To find the bug, I wrote a testbench that throws every possible number at the adder—all 512 combinations (16×16×2).
It works by comparing our adder's answer to the result from Verilog's built-in + operator. If the numbers don't match, the testbench flags an error. It's a simple but powerful way to make sure our design is flawless.

## What's Inside? 📂
Design_without_error.v: The hero of our story—a perfectly working 4-bit adder.
Design_code_with_errors.v: The villain—our adder with the hidden bug.
testbench.v: The detective—this code runs all the tests to find the bug.
output console log...: The evidence! Check out the simulation logs to see the perfect run versus the one riddled with false condition errors.

Feel free to explore the code and see the verification process in action. It’s a great little example of the day-to-day challenges in digital design!
