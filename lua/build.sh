name=$1
gcc -E $name.c -I/usr/local/include -o $name.i
gcc -S $name.c -I/usr/local/include -o $name.s
gcc $name.c -I/usr/local/include -L/usr/local/lib -llua -o $name
./$name