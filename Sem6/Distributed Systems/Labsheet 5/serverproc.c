#include "add.h"

addout * add_proc_1_svc(addin *in, struct svc_req *rqstp)
{
    static addout out;

    out = in->arg1 + in->arg2;

    return &out;
}
