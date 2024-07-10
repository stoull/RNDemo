/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';


console.log("加载业务包");

AppRegistry.registerComponent(appName, () => App);
