#!/usr/bin/env python3

from subprocess import check_output
import re

output = check_output("acpi").split()
fulltext = ""

powers = re.findall(r'\d+', str(output[3]))
percent = int(powers[0])

if str(output[2])[2:-2] == "Charging":
    fulltext += " "
elif percent < 10:
    fulltext += " "
elif percent < 30:
    fulltext += " "
elif percent < 60:
    fulltext += " "
elif percent < 85:
    fulltext += " "
elif percent <= 100:
    fulltext += " "

fulltext += str(percent) + "%"

print(fulltext)
print(fulltext)
print("#e1c98e")

exit(0)
