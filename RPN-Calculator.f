{ Simple RPN Calculator for single-digit numbers and basic operations }
{ Expects input like: 5 3 + }
{ Output will be the result followed by a newline. }

"Enter RPN (e.g., 2 3 + then Enter): "ß   { ß prints a string }

{ --- Get first number --- }
^       { Read first char (e.g., '5' ASCII 53) }
48 -    { Convert ASCII digit to integer (53 - 48 = 5). Num1 on stack. }

{ --- Get space (and ignore it) --- }
^$      { Read space char, pop and discard with $ }

{ --- Get second number --- }
^       { Read second char (e.g., '3' ASCII 51) }
48 -    { Convert ASCII digit to integer (51 - 48 = 3). Num1, Num2 on stack. }
        { Note: stack order is Num1 (bottom), Num2 (top) }

{ --- Get space (and ignore it) --- }
^$      { Read space char, pop and discard }

{ --- Get operator and store it --- }
^o:     { Read operator char (e.g., '+' ASCII 43), store in variable 'o'. Stack: Num1, Num2 }

{ --- Perform operation based on 'o' --- }
{ False's 'if' operator '?' takes a condition and a lambda [codeblock]. }
{ If condition is non-zero (true), it executes the lambda. }
{ The arithmetic operators (+, -, *, /) pop two values and push one. }

o 43 = [ + ] ?  { Is 'o' equal to ASCII 43 ('+')? If true, execute addition. }
o 45 = [ - ] ?  { Is 'o' equal to ASCII 45 ('-')? If true, execute subtraction. }
o 42 = [ * ] ?  { Is 'o' equal to ASCII 42 ('*')? If true, execute multiplication. }
o 47 = [ / ] ?  { Is 'o' equal to ASCII 47 ('/')? If true, execute division. }

{ --- Print the result --- }
" = "ß  { Print " = " }
.       { Print the integer value on top of the stack (the result) }
10.     { Print a newline character (ASCII 10) }
