# Calculator
Simulation and improver of iPhone Calculator

A relatively improving working version.

New feature:
1. A step by step tracker for calculation which needs further test.

Fixed:
1. Eliminated the uper limite of calculation, automatically showing "inf" instead of an "Error" message using extra code.

Bugs:
1. "Num1" "operator1" "=" "num2" "operator2" will make it operates "num1" and "num2" with "operator 1".
2. "Num1" "operator1" "num2" "=" "operator2" ("num3") will erase the result from operation #1. For example, 1 + 2 = (3) + 5 = will show 5 at the end instead of 8 which is the result of 3 + 5.
3. want any num key after "%" replace whatever the "%" calculates. For example, 2 % 3 = 3, 2 + 2 % 3 = 5.
4. want any num key after "+/-" to be add to the end of the number. For example, 2 +/- 3 = -23.

Possible reason/solution:
1. it did not count as calculated.
2. S: use an indecator to determine (modify at end of "%" and check at begining of num).
3. S: use an indecator to determine(modify at end of "+/-" and check at begining of num).
