#!/usr/bin/env python3

from subprocess import check_output

output = check_output("acpi").split()
fulltext = ""
percent = int(str(output[3])[2:-3])

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
