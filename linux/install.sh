#!/bin/bash
# MStudio Live (rebranded SonoBus 1.7.2) Linux installer

PREFIX=/usr/local

if [ -n "$1" ] ; then
  PREFIX="$1"
fi

echo "Installing MStudio Live to ${PREFIX} ... (specify destination as command line argument if you want it elsewhere)"

BUILDDIR=../build/MStudioLive_artefacts/Release
INSTBUILDDIR=../build/MStudioLiveInst_artefacts/Release

mkdir -p ${PREFIX}/bin
if ! cp ${BUILDDIR}/Standalone/mstudiolive  ${PREFIX}/bin/mstudiolive ; then
  echo
  echo "Looks like you need to run this as 'sudo $0'"
  exit 2
fi

mkdir -p ${PREFIX}/share/applications
cp mstudiolive.desktop ${PREFIX}/share/applications/mstudiolive.desktop
chmod +x ${PREFIX}/share/applications/mstudiolive.desktop

mkdir -p ${PREFIX}/share/pixmaps
cp ../images/sonobus_logo@2x.png ${PREFIX}/share/pixmaps/mstudiolive.png
# NOTE: icon file is still the upstream SonoBus logo (images/sonobus_logo@2x.png).
# Replace with MStudio artwork when it is ready (keep the installed name mstudiolive.png).

if [ -d ${BUILDDIR}/VST3/MStudioLive.vst3 ] ; then
  mkdir -p ${PREFIX}/lib/vst3
  cp -a ${BUILDDIR}/VST3/MStudioLive.vst3 ${PREFIX}/lib/vst3/

  echo "MStudio Live VST3 plugin installed"
fi

if [ -d ${INSTBUILDDIR}/VST3/MStudioLiveInstrument.vst3 ] ; then
  mkdir -p ${PREFIX}/lib/vst3
  cp -a ${INSTBUILDDIR}/VST3/MStudioLiveInstrument.vst3 ${PREFIX}/lib/vst3/

  echo "MStudio Live VST3i plugin installed"
fi

if [ -d ${BUILDDIR}/LV2/MStudioLive.lv2 ] ; then
  mkdir -p ${PREFIX}/lib/lv2
  cp -a ${BUILDDIR}/LV2/MStudioLive.lv2 ${PREFIX}/lib/lv2/

  echo "MStudio Live LV2 plugin installed"
fi


echo "MStudio Live application installed"
