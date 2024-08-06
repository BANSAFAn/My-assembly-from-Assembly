nasm code.asm -f bin -o image.bin
kvm -drive file=image.bin,format=raw
