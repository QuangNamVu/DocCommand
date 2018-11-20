
mkdir /tmp/bootlog

for fn in $(find /var/log/journal |grep -iname .journal)/var/log/journal/fffcbc7ab7064db7b55f241f4a0110f7/*.journa*; do
    name=${fn##*/}
    base=${name%.journal*}
    journalctl --file $fn |head -1000 > /tmp/bootlog/${base}
done
