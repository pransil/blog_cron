#!/bin/bash
# This part only needed to fake the new trackpoint
# updating latlon.txt (+0.1, -0.2 and adding the date/time)
python /home/user/dev/blog/gpx_repo/python/calculateNewTrackpoint.py
# Comvert latlon.txt to tracknewTrackpoint.gpx
python https://github.com/pransil/pransil.github.io/python/newTrackpoint.py
# newTrkpoint.sh - add a new trackpoint to data.gpx
cat https://github.com/pransil/pransil.github.io/files/newTrackpoint.gpx >> https://github.com/pransil/pransil.github.io/files/trackpoints.gpx
cat https://github.com/pransil/pransil.github.io/files/trackpoints.gpx > https://github.com/pransil/pransil.github.io/files/data.gpx
cat https://github.com/pransil/pransil.github.io/files/trackEndLines.gpx >> https://github.com/pransil/pransil.github.io/files/data.gpx
cat https://github.com/pransil/pransil.github.io/files/waypoints.gpx >> https://github.com/pransil/pransil.github.io/files/data.gpx
cat https://github.com/pransil/pransil.github.io/files/gpxEndLine.gpx >> https://github.com/pransil/pransil.github.io/files/data.gpx
git add https://github.com/pransil/pransil.github.io/files/data.gpx
git commit -m "Added new trackpoint"
git push --all
