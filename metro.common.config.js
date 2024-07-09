// metro.common.config.js

const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');
const { hasBuildInfo, writeBuildInfo, clean } = require("./build");

function createModuleIdFactory() {
    const fileToIdMap = new Map();
    let nextId = 0;
    clean("./splitconfig/intermediate/bundleCommonInfo.json");
    
    // module id 要用 number,如用string在dev环境会报错，及在生产环境会break down
    // 基础包id从0自增加
    return (path) => {
      let id = fileToIdMap.get(path);
  
      if (typeof id !== "number") {
        id = nextId++;
        fileToIdMap.set(path, id);
  
        !hasBuildInfo("./splitconfig/intermediate/bundleCommonInfo.json", path) &&
          writeBuildInfo(
            "./splitconfig/intermediate/bundleCommonInfo.json",
            path,
            fileToIdMap.get(path)
          );
      }
      return id;
    };
  }

module.exports = function (baseConfig) {
  const defaultConfig = mergeConfig(baseConfig, getDefaultConfig(__dirname));
  const {resolver: {assetExts, sourceExts}} = defaultConfig;

  return mergeConfig(
    defaultConfig,
    {
        transformer: {
            getTransformOptions: async () => ({
            transform: {
                experimentalImportSupport: false,
                inlineRequires: true,
            },
            }),
        },

        serializer: {
            createModuleIdFactory: createModuleIdFactory,
        },

        resolver: {
            assetExts: assetExts.filter(ext => ext !== 'svg'),
            sourceExts: [...sourceExts, 'svg'],
        },
    },
  );
};