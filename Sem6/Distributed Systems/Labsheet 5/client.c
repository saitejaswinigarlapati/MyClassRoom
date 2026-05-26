#include "add.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    CLIENT *cl;
    addin in;
    addout *out;

    if (argc != 4) {
        printf("Usage: client <machine> <num1> <num2>\n");
        return 1;
    }

    cl = clnt_create(argv[1], ADD_PROG, ADD_VERS, "tcp");

    in.arg1 = atol(argv[2]);
    in.arg2 = atol(argv[3]);

    out = add_proc_1(&in, cl);

    if (out == NULL) {
        printf("Error calling RPC\n");
    } else {
        printf("Result received: %ld\n", *out);
    }

    clnt_destroy(cl);

    return 0;
}
