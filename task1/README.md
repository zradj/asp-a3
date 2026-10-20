# Task 1 - Static vs. Stack vs. Heap Arrays in C

This task compares the time taken by static, stack, and heap array declarations in C. Each array contains 1 million 32-bit integers, and the declarations are retried 1 million times each. You can change these parameters by changing the `SIZE` and `TRIES` macros in `main.c`.

The `static_arr` function declares a static array by using the `static` keyword. The `stack_arr` function declares a stack array by using the usual array declaration syntax. The `heap_arr` function declares a heap array by calling `malloc`.

To run the code, compile the program first:

- `gcc`:

  ```bash
  gcc -o main main.c
  ```

- `clang`:

  ```bash
  clang -o main main.c
  ```

Then run it:

```bash
./main
```

Also, this code uses some Assembly snippets. The full C-to-Assembly conversion can be accessed here: https://godbolt.org/z/jedd3h11v

## Runtime Analysis

The results on my computer were as follows:

```
Static array: 0.004962 seconds
Stack array: 0.005470 seconds
Heap array (with free): 0.026102 seconds
Heap array (without free): 14.095886 seconds
```

### Static array

For the `static_arr` function, the corresponding Assembly code looks like this:

```asm
"static_arr":
    push    rbp
    mov     rbp, rsp
    nop
    pop     rbp
    ret
```

This basically does nothing. It enters the function and then immediately exits it. The static array is defined in a separate block and will be reused every time the function runs if it starts doing anything. Thus, the runtime of 0.004962 seconds is just function overhead.

### Stack array

`stack_arr`'s Assembly code:

```asm
"stack_arr":
    push    rbp
    mov     rbp, rsp
    sub     rsp, 3999880
    nop
    leave
    ret
```

This code just subtracts `3999880` from `rsp` and does nothing other than that. Besides this one instruction, all that happens when `stack_arr` is called is just function overhead. For this reason `stack_arr`'s runtime is almost the same as `static_arr`'s.

### Heap array

`heap_arr`'s Assembly code:

```asm
"heap_arr":
    push    rbp
    mov     rbp, rsp
    mov     edi, 4000000
    call    "malloc"
    pop     rbp
    ret
```

In addition to the usual function overhead, we have different behavior with `free` and without it.

#### With `free`

With `free`, C does one syscall to the kernel to allocate virtual memory to it (using `mmap` on Linux). After a `free`, the next allocations just reuse the already allocated virtual memory (this is an optimization done by C). For this reason, the runtime of 0.026102 seconds is mostly because of many function overheads, because `heap_arr` redirects to `malloc` and `main` calls `free` all the time.

#### Without `free`

Without `free`, virtual memory is not reused, so C asks the kernel to allocate more virtual memory each time 1 million times. Thus, there are 1 million syscalls, which results in the massive runtime of 14.095886 seconds.
