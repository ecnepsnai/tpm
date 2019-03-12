/*
Package tss provides the C bindings to tpm2-tss
*/
package tss

// #cgo CFLAGS: -I${SRCDIR}/include
// #cgo LDFLAGS: -L${SRCDIR}/libs -ldl -ltpm2 -ltss2-esys
/*
#include <tpm2/tpm2.h>
*/
import "C"

// Blah test
func Blah() {
	C.TPM2_INIT()
}
