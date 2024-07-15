const fs = require("fs");
const path = require('path');

const clean = function (file) {
  let dirPath = path.dirname(file);
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath)
    console.log('创建中间文件夹目录：', dirPath)
  }
  fs.writeFileSync(file, JSON.stringify({}));
};

const hasBuildInfo = function (file, path) {
  const cacheFile = require(file);
  return Boolean(cacheFile[path]);
};

const writeBuildInfo = function (file, path, id) {
  const cacheFile = require(file);
  cacheFile[path] = id;
  fs.writeFileSync(file, JSON.stringify(cacheFile));
};

const getCacheFile = function (file, path) {
  const cacheFile = require(file);
  return cacheFile[path] || 0;
};

const isPwdFile = (filePath) => {
  // 获取路径中的基础文件名（不带扩展名）
  const basename = path.basename(filePath, '.js');

  // 将路径分割为数组
  const pathParts = filePath.split(path.sep);

  // 获取__dirname的最后一部分作为目录名
  const currentDirName = path.basename(__dirname);

  // 检查路径的倒数第二部分是否与__dirname的最后一部分匹配
  if (pathParts[pathParts.length - 2] === currentDirName) {
    return basename;
  }

  return "";
};

module.exports = {
  hasBuildInfo,
  writeBuildInfo,
  getCacheFile,
  clean,
  isPwdFile,
};
