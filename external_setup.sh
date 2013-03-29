GRASS_DBASE_EXAMPLE=grassdata
export $GRASS_DBASE_EXAMPLE
THE_LOCATION=utm12
export $THE_LOCATION
THE_MAPSET=samplemapset2
export $THE_MAPSET
GISDBASE=grassdata
export $GISDBASE
LOCATION_NAME=utm12
export $LOCATION_NAME
MAPSET=samplemapset
export $MAPSET
THE_GRASSRC=test
export $THE_GRASSRC

mkdir ${GRASS_DBASE_EXAMPLE}/$THE_LOCATION/$THE_MAPSET/

# Create a WIND file with minimal information and no projection:
echo "proj:       0
zone:       0
north:      1
south:      0
east:       1
west:       0
cols:       1
rows:       1
e-w resol:  1
n-s resol:  1
top:        1
bottom:     0
 cols3:      1
rows3:      1
depths:     1
e-w resol3: 1
n-s resol3: 1
t-b resol:  1
" > ${GRASS_DBASE_EXAMPLE}/$THE_LOCATION/$THE_MAPSET/WIND
 
# Copy WIND-file to DEFAULT_WIND:
cp ${GRASS_DBASE_EXAMPLE}/$THE_LOCATION/$THE_MAPSET/WIND ${GRASS_DBASE_EXAMPLE}/$THE_LOCATION/$THE_MAPSET/DEFAULT_WIND
 
# Set default database driver:
echo "DBF_DRIVER: dbf
DB_DATABASE : $GISDBASE/$LOCATION_NAME/$MAPSET/dbf/
" > ${GRASS_DBASE_EXAMPLE}/$THE_LOCATION/$THE_MAPSET/VAR

echo "GISDBASE: ${GRASS_DBASE_EXAMPLE}
LOCATION_NAME: $THE_LOCATION
MAPSET: $THE_MAPSET
" > ${GRASS_DBASE_EXAMPLE}/$THE_GRASSRC

# $GISBASE points to the GRASS installation to be used:
 export GISBASE=/usr/lib/grass64
 
# Extend $PATH for the default GRASS scripts:
 export PATH=$PATH:$GISBASE/bin:$GISBASE/scripts
 
# Add GRASS library information:
 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GISBASE/lib
 
# use process ID (PID) as lock file number:
 export GIS_LOCK=$$
 
# Backup previously existing GRASS references
# export GISRC_BACKUP=${GISRC}
 
# path to GRASS settings file:
 export GISRC=${GRASS_DBASE_EXAMPLE}/$THE_GRASSRC
 
db.connect driver=dbf database='$GISDBASE/$LOCATION_NAME/$MAPSET/dbf/'