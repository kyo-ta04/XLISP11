#!/usr/bin/env pwsh
# make wrapper script for Windows (mingw32-make)
param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Arguments
)

& mingw32-make @Arguments
