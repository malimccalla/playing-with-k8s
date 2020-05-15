const package = require('./package.json');
const fs = require('fs');

package.version = '0.0.2';

fs.writeFileSync('./package.json', JSON.stringify(package));

// const newVersion =
//   currentVersion.split('.')[0] +
//   '.' +
//   currentVersion.split('.')[1] +
//   '.' +
//   (parseInt(currentVersion.split('.')[2]) + 1);

// console.log(newVersion);
