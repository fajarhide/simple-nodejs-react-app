#!/usr/bin/env sh

echo 'npm building'
set -x
npm run build
set +x

echo 'nmp starting app'
set -x
npm start &
sleep 1
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
