# newTrackPoint.py
from datetime import datetime, date, time, timezone

with open('trackPointLatLon.txt', 'r') as f:
    lat = float(f.readline())
    lon = float(f.readline())
    lat += 0.1
    lon -= 0.2
    latstr = str(round(lat, 2))
    lonstr = str(round(lon, 2))
    print("Lat: ", latstr)
    print("Lon: ", lonstr)
'''
with open('trackPointLatLon.txt', 'w') as f:
    f.write(latstr + '\n')
    f.write(lonstr + '\n')
'''
currentTime = datetime.now(timezone.utc) 
timestr = currentTime.strftime('%Y-%m-%dT%H:%M:%SZ')
print (timestr)

with open('trackPointLatLon.gpx', 'w') as f:
    t1 = '    <trkpt lat="' + latstr + '" lon="' + lonstr + '">' '\n'
    f.write(t1)
    t2 = '      <time>' + timestr + '</time>' '\n'
    f.write(t2)
    t3 = '    </trkpt>' '\n'
    f.write(t3)
    
