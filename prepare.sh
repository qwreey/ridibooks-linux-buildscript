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

# init builder
mkdir -p builder
(cat << EOF
{
  "name": "ridibooks-desktop-packager",
  "version": "1",
  "private": true,
  "scripts": {
    "package": "electron-packager ../asar-unpack --electron-version=\$ELECTRON_VERSION --platform=linux --arch=x64 --asar --out=../release --overwrite",
    "unpack": "asar extract ../app-unpack/resources/app.asar ../asar-unpack"
  },
  "devDependencies": {
    "electron": "^28.0.0",
    "@electron/packager": "^19.0.1",
    "@electron/asar": "^4.0.1"
  }
}
EOF
)> builder/package.json
npm i --prefix builder
ELECTRON_VERSION="$(cat builder/node_modules/electron/package.json | grep "\"version\": " | sed 's/ *"version": "//g' | sed 's/"//g')"

# unpack setup.exe
[ -e setup-unpack ] && rm -r setup-unpack
[ -e app-unpack ] && rm -r app-unpack
[ -e asar-unpack ] && rm -r asar-unpack
7z x setup.exe -osetup-unpack
7z x setup-unpack/\$PLUGINSDIR/app-64.7z -oapp-unpack
npm run unpack --prefix builder

# backup private file
[ -e package-backup ] && rm -r package-backup
mkdir -p package-backup
cp -r asar-unpack/node_modules/@ridi asar-unpack/node_modules/@ridi-app package-backup

# install deps
rm -r asar-unpack/node_modules
cp -r package-backup asar-unpack/node_modules
npm i --prefix asar-unpack

