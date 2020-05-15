const package = require('./package.json');
const fs = require('fs');

const currentVersion = package.version;

const newVersion =
  currentVersion.split('.')[0] +
  '.' +
  currentVersion.split('.')[1] +
  '.' +
  (parseInt(currentVersion.split('.')[2]) + 1);

package.version = newVersion;

fs.writeFileSync('./package.json', JSON.stringify(package, null, 2));
