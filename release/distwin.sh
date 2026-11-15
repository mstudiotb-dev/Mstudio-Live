#!/bin/bash
# MStudio Live (rebranded SonoBus 1.7.2) Windows distribution script.
# Packages the 64-bit Release artefacts (Standalone + VST3 only) into the installer.
#
# ---------------------------------------------------------------------------
# CODE-SIGNING TRAP - READ THIS BEFORE RUNNING:
#   This script REQUIRES a code-signing certificate or it exits immediately:
#     - env var CERTFILE must point to a .pfx/.p12 code-signing certificate
#       (e.g.  export CERTFILE=/path/to/MStudioCodeSigning.p12)
#     - $2 is the certificate password (CERTPASS)
#   Without CERTFILE the script stops at the check below with exit code 2
#   and NO installer is produced.
#   For an UNSIGNED test build, comment out the CERTFILE check below AND
#   remove the "/Ssigntool=..." argument from the iscc call; also set
#   SignedUninstaller=no in wininstaller.iss (it needs a sign tool).
# ---------------------------------------------------------------------------

if [ -z "$1" ] ; then
   echo "Usage: $0 <version> <certpassword>"
   exit 1
fi

VERSION=$1

CERTPASS=$2

if [ -z "$CERTFILE" ] ; then
  echo You need to define CERTFILE env variable to sign anything
  exit 2
fi

BUILDDIR='../build/MStudioLive_artefacts/Release'
INSTBUILDDIR='../build/MStudioLiveInst_artefacts/Release'

rm -rf MStudioLive

mkdir -p MStudioLive/Plugins/VST3

cp -v ../doc/README_WINDOWS.txt MStudioLive/README.txt
cp -v ${BUILDDIR}/Standalone/MStudioLive.exe MStudioLive/
cp -pHLRv ${BUILDDIR}/VST3/MStudioLive.vst3 MStudioLive/Plugins/VST3/
cp -pHLRv ${INSTBUILDDIR}/VST3/MStudioLiveInstrument.vst3 MStudioLive/Plugins/VST3/

mkdir -p instoutput
rm -f instoutput/*


iscc /O"instoutput" "/Ssigntool=signtool.exe sign /t http://timestamp.digicert.com /f ${CERTFILE} /p ${CERTPASS} \$f"  /DSBVERSION="${VERSION}" wininstaller.iss

EXEFILE=mstudiolive-${VERSION}-win.exe
rm -f ${EXEFILE}
cp instoutput/MStudioLive-${VERSION}-Installer.exe ${EXEFILE}
