#include "tpm2.h"
#include <stdio.h>
#include <tss2/tss2_common.h>
#include <tss2/tss2_esys.h>
#include <tss2/tss2_mu.h>
#include <tss2/tss2_sys.h>
#include <tss2/tss2_tcti_device.h>
#include <tss2/tss2_tcti.h>
#include <tss2/tss2_tcti_mssim.h>
#include <tss2/tss2_tpm2_types.h>

extern void TPM2_INIT(void) {
    ESYS_CONTEXT * context;

    TSS2_RC result = Esys_Initialize(&context, NULL, NULL);
    if (result != TSS2_RC_SUCCESS) {
        printf("UGH IT DIDN'T WORK!");
        return;
    }
    Esys_Free(context);
}