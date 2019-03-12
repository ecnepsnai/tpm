#!/bin/bash
set -e

MODULE_NAME=tpm2
MODULES=(tpm2)
for FILE in ${MODULES[@]}; do
  gcc $FILE.c -o $FILE.o \
    -c \
    -g \
    -I/usr/include/tss2/ \
    -fPIC \
    -ftrapv \
    -Wextra \
    -Wall \
    -Werror \
    -Wfloat-equal \
    -Wundef \
    -Wshadow \
    -Wpointer-arith \
    -Wcast-align \
    -Wstrict-prototypes \
    -Wstrict-overflow=5 \
    -Wwrite-strings \
    -Waggregate-return
done

ar rcs lib${MODULE_NAME}.a $(printf "%s.o " "${MODULES[@]}")
mkdir -p ../include/${MODULE_NAME}
mkdir -p ../libs
cp *.h ../include/${MODULE_NAME}/
mv lib${MODULE_NAME}.a ../libs
