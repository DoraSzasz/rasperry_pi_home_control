#!/bin/bash
DIR="/home/pi/OpenRemote-Controller-2.1.0_SNAPSHOT-2013-06-17/webapps/controller"
DIR2="/home/pi"
#set to C if using Celsius
TEMP_SCALE="C"

#define the desired colors for the graphs
INTEMP_COLOR="#CC0000"
OUTTEMP_COLOR="#0000FF"

#hourly
rrdtool graph $DIR/temp_hourly.png --start -4h \
-w 250 -h 80 \
DEF:temp=$DIR2/hometemp.rrd:temp:AVERAGE \
LINE1:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR2/hometemp.rrd:outtemp:AVERAGE \
LINE1:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"

#daily
rrdtool graph $DIR/temp_daily.png --start -1d \
-w 250 -h 80 \
DEF:temp=$DIR2/hometemp.rrd:temp:AVERAGE \
LINE1:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR2/hometemp.rrd:outtemp:AVERAGE \
LINE1:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"

#weekly
rrdtool graph $DIR/temp_weekly.png --start -1w \
-w 250 -h 80 \
DEF:temp=$DIR2/hometemp.rrd:temp:AVERAGE \
DEF:outtemp=$DIR2/hometemp.rrd:outtemp:AVERAGE \
LINE1:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
LINE1:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"

#monthly
rrdtool graph $DIR/temp_monthly.png --start -1m \
-w 250 -h 80 \
DEF:temp=$DIR2/hometemp.rrd:temp:AVERAGE \
DEF:outtemp=$DIR2/hometemp.rrd:outtemp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
LINE2:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"

#yearly
rrdtool graph $DIR/temp_yearly.png --start -1y \
-w 250 -h 80 \
DEF:temp=$DIR2/hometemp.rrd:temp:AVERAGE \
DEF:outtemp=$DIR2/hometemp.rrd:outtemp:AVERAGE \
LINE1:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
LINE1:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
