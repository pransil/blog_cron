#!/bin/bash
# newTrkpoint.sh - add a new trackpoint to data.gpx
cat ../files/newTrackpoint.gpx >> ../files/trackpoints.gpx
cat ../files/trackpoints.gpx > ../files/data.gpx
cat ../files/trackEndLines.gpx >> ../files/data.gpx
cat ../files/waypoints.gpx >> ../files/data.gpx
cat ../files/gpxEndLine.gpx >> ../files/data.gpx
git add ../files/data.gpx
git commit -m "Added new trackpoint"
git push --all
