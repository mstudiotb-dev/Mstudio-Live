#!/bin/bash
# MStudio Live (rebranded SonoBus 1.7.2) Linux uninstaller

PREFIX=/usr/local

if [ -n "$1" ] ; then
  PREFIX="$1"
fi

echo "Un-Installing MStudio Live from ${PREFIX} ... (specify destination as command line argument if you have it elsewhere)"

# remove old binary name
if [ -f ${PREFIX}/bin/MStudioLive ] ; then
  if ! rm -f ${PREFIX}/bin/MStudioLive ; then
    echo
    echo "Looks like you need to run this with 'sudo $0'"
    exit 2
  fi
fi

if [ -f ${PREFIX}/bin/mstudiolive ] ; then
  if ! rm -f ${PREFIX}/bin/mstudiolive ; then
    echo
    echo "Looks like you need to run this with 'sudo $0'"
    exit 2
  fi
fi

# also remove upstream SonoBus leftovers, if a user is replacing it
rm -f ${PREFIX}/bin/SonoBus
rm -f ${PREFIX}/bin/sonobus

rm -f ${PREFIX}/share/applications/mstudiolive.desktop
rm -f ${PREFIX}/share/applications/sonobus.desktop
rm -f ${PREFIX}/pixmaps/mstudiolive.png
rm -f ${PREFIX}/pixmaps/sonobus.png

rm -rf ${PREFIX}/lib/vst3/MStudioLive.vst3
rm -rf ${PREFIX}/lib/vst3/MStudioLiveInstrument.vst3
rm -rf ${PREFIX}/lib/vst3/SonoBus.vst3
rm -rf ${PREFIX}/lib/vst3/SonoBusInstrument.vst3
# remove old VST name
rm -rf ${PREFIX}/lib/vst3/mstudiolive.vst3
rm -rf ${PREFIX}/lib/lv2/MStudioLive.lv2

echo "MStudio Live uninstalled"
