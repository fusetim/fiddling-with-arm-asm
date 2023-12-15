# ARM32 Assembly Fiddling

Please install qemu and a arm32 toolchain like `arm-none-linux-gnueabihf-gcc`

How to compile and run:

```
nano hello_world.s # Input
arm-none-linux-gnueabihf-as -o hello_world.o hello_world.s # Transform in machine code
arm-none-linux-gnueabihf-ld -static hello_world.o -o hello_world # Link everything
qemu-arm -L /usr/arm-none-linux-gnueabihf/ ./hello_world # Run in qemu
```

## Ressources

* [AzeriaLabs - ARM on x86 (qEMUuser)](https://azeria-labs.com/arm-on-x86-qemu-user/)
* [AzeriaLabs - ARM assembly basics](https://azeria-labs.com/writing-arm-assembly-part-1/)
