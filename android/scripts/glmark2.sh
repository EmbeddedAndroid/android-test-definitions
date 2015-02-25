#!/system/bin/sh
#
# glmark2
#
# Copyright (C) 2013, Linaro Limited.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
# owner: harigopal.gollamudi@linaro.org
#

logcat -c
am start org.linaro.glmark2/.Glmark2Activity 
if logcat -v time | grep -qnri "Set up failed"
then 
    echo "successfully exited"
    logcat -d | grep "I/glmark2" | sed -e 's/] /_/g' -e 's/=/_/g' -e  's/,/_/g' -e 's/;/_/g' -e 's/<//g' -e 's/>//g' -e  's/\[//g' -e 's/\///g' -e 's/Iglmark2//g' -e 's/( 4435)://g' | awk 'BEGIN{FS=""} {print  $0 " pass "}'
    exit 0
fi
