//writeConfig.js

// import { name, versionNumStr, specName } from '../app.json';
const appInfo = require('../app.json');
const fs = require('fs');
const { clean } = require("../build");

function getTime() {
  const now = new Date();
  return `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()} ${now.getHours()}:${now.getMinutes()}`;
}

// 定义你要写入config.json的配置数据
const configData = {
  moduleName: appInfo.name,
  versionNumStr: appInfo.versionNumStr,
  specName: appInfo.specName,
  createTimeStr: getTime()
};

// 创建打包目录
const iosPath = `./bundle/ios/${appInfo.displayName}/`;
const androidPath = `./bundle/android/${appInfo.displayName}/`;

if (!fs.existsSync(iosPath)) {
    fs.mkdirSync(iosPath, { recursive: true });
    console.log(`Directory created successfully at: ${iosPath}`);
} else {
    console.log('Directory already exists.');
}

if (!fs.existsSync(androidPath)) {
  fs.mkdirSync(androidPath, { recursive: true });
  console.log(`Directory created successfully at: ${androidPath}`);
} else {
    console.log('Directory already exists.');
}

// iOS将配置数据写入到config.json文件
clean(`./bundle/ios/${appInfo.displayName}/config.json`);
fs.writeFileSync(`./bundle/ios/${appInfo.displayName}/config.json`, JSON.stringify(configData, null, 2), (err) => {
  if (err) {
    console.error('Error occurred while creating config.json:', err);
    process.exit(1);
  } else {
    console.log('Successfully created config.json');
  }
});

// Android将配置数据写入到config.json文件
clean(`./bundle/android/${appInfo.displayName}/config.json`);
fs.writeFileSync(`./bundle/android/${appInfo.displayName}/config.json`, JSON.stringify(configData, null, 2), (err) => {
  if (err) {
    console.error('Error occurred while creating config.json:', err);
    process.exit(1);
  } else {
    console.log('Successfully created config.json');
  }
});