/**
 * Service Worker
 */

const _version = 'v1';
const cacheName = 'v1';
const cacheList = [
    '/renda/images/LogoSePredi.png',
    '/renda/images/logo.png'
]

const log = msg => {
  console.log(`[ServiceWorker ${_version}] ${msg}`);
}