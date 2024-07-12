/**
 * @format
 */

import {AppRegistry} from 'react-native';
import {name as appName} from './app.json';

const shinetoolskit = require('./shinetoolskit/shinetoolskit');

const { ShineToolsKit } = require("./shinetoolskit/shinetoolskit");
AppRegistry.registerComponent(appName, () => ShineToolsKit);


shinetoolskit.startListening();