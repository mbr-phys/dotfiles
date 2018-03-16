#!/usr/bin/env python3

from subprocess import check_output

fulltext = ""
quality = int(str(check_output("iwconfig wlp2s0 | grep -i quality | cut -c24-25")))
ssid = int(str(check_output("echo $([[ -z $(iwgetid -r) ]] || echo $(iwgetid -r))")))

if quality < 30:
    fulltext += " "
elif quality < 50:
    fulltext += " "
elif quality < 60:
    fulltext += " "
elif quality < 70:
    fulltext += " "

fulltext += str(ssid)

print(fulltext)
print(fulltext)
print("#ebdbb2")

exit(0)
