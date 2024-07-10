/**
 * @format
 */

import {AppRegistry} from 'react-native';
import {name as appName} from './app.json';

const { testPrint } = require("./shinetoolskit");

AppRegistry.registerComponent(appName, () => () => null);

testPrint();
