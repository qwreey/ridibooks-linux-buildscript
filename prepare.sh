#/bin/sh

function getOption() {
	grep "[ -]*$1 *: *" latest.yml | sed "s/[ \\-]*$1 *: *//g"
}
if [ -e latest.yml ]; then
	VERSION_CURR="$(getOption version)"
fi
if [ "$pkgver" != "$VERSION_CURR" ]; then
	curl https://viewer-ota.ridicdn.net/pc_electron/latest.yml -o latest.yml
fi

# download icon
[ ! -e icon.png ] && curl "https://static.ridicdn.net/books-backend/p/39a20f/books/dist/favicon/apple-touch-icon-180x180.png?20220405" -o icon.png

# download latest installer
VERSION_SERVER="$(getOption version)"
FILE="$(getOption url | sed "s/ /%20/g")"
URL="https://viewer-ota.ridicdn.net/pc_electron/${FILE}"
SHA512="$(getOption sha512)"
if [ "$VERSION_CURR" = "$VERSION_SERVER" ]; then
	echo "latest setup.exe downloaded already"
	exit
fi
curl $URL -o setup.exe

