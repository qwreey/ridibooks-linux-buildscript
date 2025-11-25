#/bin/sh

function getOption() {
	grep "[ -]*$1 *: *" latest.yml | sed "s/[ \\-]*$1 *: *//g"
}
if [ -e latest.yml ]; then
	VERSION_CURR="$(getOption version)"
fi

curl https://viewer-ota.ridicdn.net/pc_electron/latest.yml -o latest.yml

# download latest installer
VERSION_SERVER="$(getOption version)"
FILE="$(getOption url | sed "s/ /%20/g")"
URL="https://viewer-ota.ridicdn.net/pc_electron/${FILE}"
SHA512="$(getOption sha512)"
if [ "$VERSION_CURR" = "$VERSION_SERVER" ]; then
	echo "Already latest build, exit"
	exit
fi
curl $URL -o setup.exe

