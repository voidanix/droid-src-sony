#!/bin/bash
#
# Run this script every time you update .tmpl file(s).
# Do not run dhs/precheckin.sh anymore, this script takes care of that.
#
# This script can eventually be upstreamed to droid-hal-source when there
# appears another multi-device droid-src repo (currently there is only one -
# - for Xperias).

tmpls=(*.spec.tmpl)

for f in "${tmpls[@]}"; do
    rm -f other-tmpl-sources
    i=100
    for tmpl in "${tmpls[@]}"; do
        if [ "$tmpl" != "$f" ]; then
            echo "Source$i: $tmpl" >> other-tmpl-sources
            ((i++))
        fi
    done
    ./dhs/precheckin.sh "${f%.tmpl}"
done
rm -f other-tmpl-sources
