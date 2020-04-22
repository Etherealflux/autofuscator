#include <stdio.h>

void pointless(void) {
    printf("I'm never called :(\n\n");
}
int main(int argc, char** argv) {
    printf("Hello world!\n");
    return 0;
}
