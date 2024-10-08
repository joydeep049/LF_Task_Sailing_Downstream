# LF Task for Sailing Downstream III 

<h2>Task</h2> 

"Write a program in OCaml that reads a text file (or from the terminal). For each line of input, extract any contiguous integers into a list. Emit the list. Sum the list. Emit the sum Finally, emit the sum of all of the numbers."

<h3>Example input</h3>

```bash
  sq: RV128 only, not RV64 nor RV32
  lr (? Figure A.13, part 2)

  jalr: broken 2 times
```

<h3>Example output </h3>

```bash
  128 + 64 + 32 = 224
  13 + 2 = 15
  = 0
  2 = 2
  224 + 15 + 0 + 2 = 241
```

<h2>Solutions</h2>

<h3>Approach 1: Brute Force</h3>
This approach processes the input string in an imperative style:

1. It loops through each character in the string.
1. When it encounters a digit, it starts an internal loop from there to capture the entire number.
1. The numbers are extracted and summed up for each line, and these results are formatted and outputted similarly to the example.

<h3>Approach 2: Optimal Solution Using Regex</h3>
This method utilizes OCaml's Str module:

1. The Str.regexp function is used to identify and extract all contiguous integers in each line of the input.
1. Numbers are then processed to compute the sum for each line.
1. Results are formatted according to the example output provided.


<h2> Outputs </h2>

<h3> Input </h3>

```bash
I am Joydeep
I am also 01

100
kvhbfvksb
sfkjbsgb7addbdk7
STOP
```
<h3> Output </h3>

```bash
= 0
1 = 1
= 0
100 = 100
= 0
7 + 7 = 14
0 + 1 + 0 + 100 + 0 + 14 = 115
```

<h3> How to Run the code </h3>

 1. Fork the repository 

 ```bash
 git clone https://github.com/joydeep049/LF_Task_Sailing_Downstream.git
 cd LF_Task_Sailing_Downstream
 ```

 2. Compile the program using OCamlFind

 ```bash
 ocamlfind ocamlc -o program_method_1 -package str -linkpkg codes/task_method_1.ml
 ```

 3. Run the program from the terminal 

 ```bash
 ./program_method_1
 ```