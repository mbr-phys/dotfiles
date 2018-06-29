#!/usr/bin/env python3

from subprocess import check_output

output = check_output("acpi").split()
fulltext = ""

if str(output[2])[2:-2] == "Charging":
    percent = int(str(output[3])[2:-3])
    fulltext += " "
    fulltext += str(percent) + "%"
elif str(output[2])[2:-2] == "Discharging":
    percent = int(str(output[3])[2:-2])
