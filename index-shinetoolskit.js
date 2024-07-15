/**
 * @format
 */

// import {AppRegistry} from 'react-native';
// const { ShineToolsKit } = require("./shinetoolskit/shinetoolskit");
// AppRegistry.registerComponent("shinetools", () => ShineToolsKit);

const shinetoolskit = require('./shinetoolskit/shinetoolskit');
shinetoolskit.startListening();