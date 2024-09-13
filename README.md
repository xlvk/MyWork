# MyWork

**-this is my work to any asm project, this repo is for fun.**

### the structure of the repo

```
.
├── c.asm
├── .gitignore
└── README.md
```

## the c.asm file (Simple Calculator in x86 Assembly).

This project implements a basic calculator in x86 assembly language. The program performs simple arithmetic operations on two single-digit numbers.

### Features

- Accepts two single-digit numbers as input
- Supports four basic arithmetic operations: addition (+), subtraction (-), multiplication (*), and division (/)
- Displays the result of the operation

### How to Use

1. Compile the assembly file:
```sh
    nasm -f elf32 c.asm -o calculator.o  
```

2. Link the object file:
```sh
    ld -m elf_i386 calculator.o -o calculator 
```

3. Run the program:
```sh
    ./calculator
```

4. Follow the prompts:
- Enter the first number (0-9)
- Enter the second number (0-9)
- Choose an operation (+, -, *, /)

5. The program will display the result

### Limitations

- Only works with single-digit numbers (0-9)
- Division by zero is not handled (the program will skip division if the denominator is zero)
- The result is displayed as a single digit, so operations resulting in two-digit numbers will show incorrect results

### Technical Details

- Written in x86 assembly language
- Uses Linux system calls for input/output operations
- Implements basic arithmetic operations using CPU registers

### Future Improvements

- Handle multi-digit numbers
- Implement error handling for invalid inputs
- Add support for floating-point operations
- Extend to handle more complex mathematical functions