#!/bin/bash
FPATH=/home/user/dev/blog/gpx_repo/blog_cron
# This part only needed to fake the new trackpoint
# updating latlon.txt (+0.1, -0.2 and adding the date/time)
python $FPATH/python/calculateNewTrackPoint.py
# Comvert latlon.txt to tracknewTrackpoint.gpx
python $FPATH/python/newTrackPoint.py
# newTrkpoint.sh - add a new trackpoint to data.gpx
cat $FPATH/files/newTrackpoint.gpx >> $FPATH/files/trackpoints.gpx
cat $FPATH/files/trackpoints.gpx > $FPATH/files/data.gpx
cat $FPATH/files/trackEndLines.gpx >> $FPATH/files/data.gpx
cat $FPATH/files/waypoints.gpx >> $FPATH/files/data.gpx
cat $FPATH/files/gpxEndLine.gpx >> $FPATH/files/data.gpx
cp $FPATH/files/data.gpx ../../pransil.github.io
cd ../../pransil.github.io
git add data.gpx
git commit -m "Added new trackpoint"
git push --all
