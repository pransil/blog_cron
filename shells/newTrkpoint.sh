#!/bin/bash
# This part only needed to fake the new trackpoint
# updating latlon.txt (+0.1, -0.2 and adding the date/time)
python ../python/calculateNewTrackpoint.py
# Comvert latlon.txt to tracknewTrackpoint.gpx
python ../python/newTrackpoint.py
# newTrkpoint.sh - add a new trackpoint to data.gpx
cat ../files/newTrackpoint.gpx >> ../files/trackpoints.gpx
cat ../files/trackpoints.gpx > ../files/data.gpx
cat ../files/trackEndLines.gpx >> ../files/data.gpx
cat ../files/waypoints.gpx >> ../files/data.gpx
cat ../files/gpxEndLine.gpx >> ../files/data.gpx
git add ../files/data.gpx
git commit -m "Added new trackpoint"
git push --all
