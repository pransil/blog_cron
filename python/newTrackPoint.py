# newTrackPoint.py
# Make a new track point file if the new lat/lon is different than the previous by more than distance_threshold
import os

from datetime import datetime, date, time, timezone

distance_threshold = 0.05

with open('../files/latlon_previous.txt', 'r') as fp:
    prev_lat = float(fp.readline())
    prev_lon = float(fp.readline())

with open('../files/latlon.txt', 'r') as f:
    lat = float(f.readline())
    lon = float(f.readline())
    lat_diff = abs(lat - prev_lat)
    lon_diff = abs(lon - prev_lon)
    # Don't make a new track point if the lat/lon is the same or close
    if (lat_diff < distance_threshold) or (lon_diff < distance_threshold):
        print("No new track point.")
        exit()
    else:
        print("New track point.")

latstr = str(round(lat, 2))
lonstr = str(round(lon, 2))
print("Prev Lat: ", prev_lat)
print("Prev Lon: ", prev_lon)

with open('../files/latlon_previous.txt', 'w') as f:
    f.write(latstr + '\n')
    f.write(lonstr + '\n')

currentTime = datetime.now(timezone.utc) 
timestr = currentTime.strftime('%Y-%m-%dT%H:%M:%SZ')
print (timestr)

with open('../files/newTrackpoint.gpx', 'w') as f:
    t1 = '      <trkpt lat="' + latstr + '" lon="' + lonstr + '">' '\n'
    f.write(t1)
    t2 = '        <time>' + timestr + '</time>' '\n'
    f.write(t2)
    t3 = '      </trkpt>' '\n'
    f.write(t3)
    
