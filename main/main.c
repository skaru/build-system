#include <stdio.h>
#include "bar.h"
#include "main.h"
#include "config.h"

#ifdef CONFIG_FOO_ENABLE
    #include "foo.h"
#endif

int main() {
    printText("MAIN");

    #ifdef CONFIG_FOO_ENABLE
        printFoo();
    #endif

    printBar();
    
    return 0;
}

void printText(const char* string) {
    puts(string);
}