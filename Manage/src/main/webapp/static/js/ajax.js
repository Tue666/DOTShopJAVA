// Common
const pathname = window.location.pathname;
const appName = pathname.substr(0, window.location.pathname.indexOf("/", 2));
const xhrURL = window.location.origin + appName + '/ajax';
