📌 Project: Full Subtractor with SystemVerilog Testbench (Mailbox-Based)
🔹 Design (DUT)
The module F_S implements a 1-bit Full Subtractor.

Inputs:
a → Minuend
b → Subtrahend
c → Borrow-in

Outputs:
sub → Difference bit
barrow → Borrow-out

Logic implemented:
sub     = a ^ b ^ c;  
barrow  = (~a & b) | (b & c) | (c & ~a);  

🔹 Testbench (SystemVerilog, Class-Based)

The testbench is written in SystemVerilog OOP style with mailbox communication:

Transaction Class (transaction)
Defines input signals a, b, c as randc (random cyclic).
Includes a display() task to print generated values.

Generator Class (generator)

Creates randomized transactions.
Puts them into the mailbox for the driver.

Driver Class (driver)

Fetches transactions from the mailbox.
Drives DUT inputs through a virtual interface.
Captures DUT outputs (sub, barrow) and displays them.

Interface (inter)

Connects DUT and testbench seamlessly.
Testbench Module (tb)
Instantiates DUT (F_S), generator, driver, and mailbox.
Runs generator & driver in parallel (fork...join).
Stimulates DUT for 10 random transactions.

🔹 Simulation Output

Displays input values driven to the DUT.
Shows DUT outputs (sub, barrow).
Waveform confirms correct subtraction behavior.

Example log snippet:

data transacted : a=0 b=1 c=0
data driven     : a=0 b=1 c=0
output data     : sub=1 barrow=1

🔹 Key Learning

Demonstrates random stimulus generation using randc.
Uses mailbox-based communication between generator and driver.
Applies OOP-based testbench methodology (foundation of UVM).
Verifies functionality of Full Subtractor.

