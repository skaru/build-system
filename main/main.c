#include <stdio.h>
#include "bar.h"
#include "main.h"

int main() {
    printText("MAIN");
    printBar();
    
    return 0;
}

void printText(const char* string) {
    puts(string);
}