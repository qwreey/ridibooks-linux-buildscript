#/bin/sh

# build
ELECTRON_VERSION=$ELECTRON_VERSION npm run package --prefix builder
cp -r app-unpack/resources/assets app-unpack/resources/dist release/Ridibooks-*/resources

