📌 Project: Calendar Generator in SystemVerilog

🔹 Design Overview
This project implements a Calendar Generator using SystemVerilog.
The code dynamically displays all 12 months of a year with proper day alignment (Sun–Sat), simulating how a real calendar is structured.

🔹 Key Features

Stores month names (JANUARY → DECEMBER) in a string array.
Stores day names (Sun → Sat) in a string array.
Uses days_in_month array to define the number of days in each month.
Supports start day selection (e.g., start_day=5 → Thursday).
Automatically adjusts the starting weekday of each month using modular arithmetic.
Neatly aligns dates under the correct weekday headers.

🔹 Logic Explanation

Initialization
Arrays store day names, month names, and days per month.
A variable start_day defines the first weekday of the year (1=Sunday, 2=Monday, …, 7=Saturday).

Month Iteration
Loops through all 12 months.
Prints month name and weekday headers.

Day Alignment
Skips empty slots until the correct start_day is reached.
Prints dates sequentially (1 to days_in_month[k]).
New Line Handling
A new line is inserted after every 7 days to simulate weekly rows.

Next Month Adjustment
Calculates the first day of the next month:
start_day = ((start_day-1) + days_in_month[k]) % 7 + 1;

🔹 Example Output (Partial)

If the year starts on a Thursday, output looks like:

JANUARY
sun     mon     tue     wed     thu     fri     sat
                                1       2       3
4       5       6       7       8       9      10
...

🔹 Learning Outcome

Use of arrays and string handling in SystemVerilog.
Loop constructs (for loops) for structured printing.
Mathematical calculation to roll over days across months.
Real-world style problem solving (simulating a calendar with HDL).
