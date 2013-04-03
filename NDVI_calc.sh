#Import files
r.in.gdal -e -o input=$inputB3 output=b3
r.in.gdal -e -o input=$inputB4 output=b4
r.mapcalc "NDVI = (b4 - b3)/(b3 + b4)"
r.mapcalc "MSAVI2 = (2 * b4 + 1 - sqrt((2 * b4 + 1) ^ 2 - 8 * (b4 - b3)))/(2)"
