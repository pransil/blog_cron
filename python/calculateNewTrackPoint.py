# newTrackPoint.py
# Make a new track point file if the new lat/lon is different than the previous by more than distance_threshold
import os

from datetime import datetime, date, time, timezone

distance_threshold = 0.05
currentTime = datetime.now(timezone.utc) 
timestr = currentTime.strftime('%Y-%m-%dT%H:%M:%SZ')
print (timestr)

with open('../files/latlon.txt', 'r') as f:
    lat = float(f.readline())
    lon = float(f.readline())
    lat += 0.1
    lon -= 0.2

latstr = str(round(lat, 2))
lonstr = str(round(lon, 2))
print("Lat: ", latstr)
print("Lon: ", lonstr)
with open('../files/latlon.txt', 'w') as f:
    f.write(latstr + '\n')
    f.write(lonstr + '\n')
    f.write(timestr + '\n')


    
