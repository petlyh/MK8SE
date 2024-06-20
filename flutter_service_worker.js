'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "7e33bd5497c767ff5c5ab8b27bc2c1b4",
"icons/Icon-maskable-192.png": "1f04a35e8ad9b6f477d26adcc79dcbbe",
"icons/Icon-192.png": "1f04a35e8ad9b6f477d26adcc79dcbbe",
"icons/Icon-maskable-512.png": "7e33bd5497c767ff5c5ab8b27bc2c1b4",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"flutter_bootstrap.js": "48b2a3820856323996cb50ebc791cb70",
"version.json": "0b4946966e35a1bf24e79a1cb4e64b71",
"favicon.png": "e55f4c73328da6c13688e7235eec1c16",
"main.dart.js": "b7e7f21d59287be392d21692524951cf",
"assets/NOTICES": "4888931873cda14e6d4867869e2beec9",
"assets/AssetManifest.bin": "8b2f2b8913449c54ccf2d6d3fe18c806",
"assets/assets/userdata-empty.dat": "fa595f15feeba8908da79b9e3b4c0232",
"assets/assets/icon.png": "f718e5c272494b0a4fd5bbe259e46527",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "7a1dc243eaafe1d05690c25185f7e5c8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e275572fdef47fa55e507e3b053d71c2",
"assets/AssetManifest.json": "7492095acedf51edc6bc0727cb1b0ca2",
".git/index": "ca0ee87f0a7b3789fc7d70f261c1f95a",
".git/FETCH_HEAD": "6b73304ccc00fddc043d9fead6ef65a7",
".git/logs/HEAD": "ad69c72ac9bf7396608d0fca3685d92a",
".git/logs/refs/heads/gh-pages": "54cf7ec2da1fa14f4dd07fc7d63a346f",
".git/logs/refs/remotes/origin/gh-pages": "bd655f47cbe4ae146f5e943834fb9dc4",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/shallow": "7e038d43bfa7f43255540bb301d24bfb",
".git/config.worktree": "f0198bfdba75fcb121daecc3fa77420b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/objects/24/e980ad98cbcb8fdc32de65706235d173885dea": "8b3e61f92f9e7403f283268ea81bfbda",
".git/objects/24/058fea30f8e6fb035da7918f76ba8cefca6ce6": "d52bef5f485ebc0e939baedbc328e8f2",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/d7/19c052af26d541442025aef6802b80851cb987": "661d7de194f80c91e089b106661116f2",
".git/objects/db/cc65ccca33dfa3b8f294f6e4fd6e39515a011f": "ad2260caf4313105f195015cdf69ee33",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/b9/779d4c4f060f82cba005a6d0fb83a99392c649": "5be68e90f807e936e7d23f3a603dc3bc",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/c4/3b40ed2f6ebe6762616531bd6bdae728ac3c5c": "b6657fc8da18a44ea19846154881c38c",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/4b/c6f3f7ca3e1eb0c14130d874315b31e3f0daa7": "57acfaf18e396d49434d6c2fa8592136",
".git/objects/0f/c344c7e8b9e32ea1ad91f30ded22556352d7bf": "a8a30f28869f7378465338066f34d80d",
".git/objects/a8/b73508cef9e8138da2d1e9cb27c460dce63863": "adc315eed1b00a1fe796ce2e6aae2b4f",
".git/objects/a8/d5e695887eacbad0a6a6cb77f0ff46beb8e1c1": "ca0e3a9a191bcac5686d93123532302d",
".git/objects/50/0204299d4c4415c8a115e5152e35a2bce551c1": "235bc920c75c8127863c4c61e8def39a",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/0d/1cbf1a62f5e7c1ab0b938f123e2022a1f72f01": "0cdcd2753cc06b44b033bf9404daa3f8",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/ac/2735a55c5d681a99c5e5d55fc091e03e017225": "6d2e4c58f8c47403ca9dc323ff2fc7b3",
".git/objects/ac/a41f9488593bc59139669cb1efccfae410bc6e": "6c9e259e2f93fa880afb087afb5c8a19",
".git/objects/91/ce232f0dcf9568c36c20ec4c087f3d0222d4d7": "63663c238b53aa01ac1a3c57ab7b0c8a",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/e9/c38a5413870d6d93e440f4fc0affff5df09258": "b61af8aba4bab6e5b5a38898a3841232",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/48/d5e462c78cbfeab6101ad841e39f08161f2a68": "5eef8ae6e6047ff8c871ece0915cb2d5",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/7e/20eb662bc132e8ef14722fa87771971f62a831": "92394693ef4d78522cc6aaa1b13f9ac8",
".git/objects/8a/e948e93636baaccd93f6ca5c8e1985ea4e6466": "9c119dd5521f239fff576206d0977ebb",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/68/efdac51c02f6fd71273f87330b863898cd39a0": "c51d06f8acc53112111d51bf9a88d3b6",
".git/objects/cd/25c8156c2689ec3e20f91b7572123e6d8967ac": "e3713ef08e7d206ee3dc7160771f7b6e",
".git/objects/62/c89ee094658c7a9465824fdb42793a64ea557b": "133cd5da638f245b079d9e9cdc29ae38",
".git/objects/ff/1dc00670e0bb2333e189998531f2b1475cc73a": "aff88d2bdd11dbf275ff573ab1f1e887",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/20/10c632d2ae5f3e03e90a01e1c7a0b6a1348c7d": "e8fac5df81c5b1365dfcb09bbbf8987c",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/a2/66a5423f2301e62aab40f74e1f21d024597d91": "cba3cd22b570edaab750e9b9f5d7308d",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/config": "d353b49c52ee478d80487a4b91af161e",
".git/refs/heads/gh-pages": "7e038d43bfa7f43255540bb301d24bfb",
".git/refs/remotes/origin/gh-pages": "7e038d43bfa7f43255540bb301d24bfb",
"index.html": "21748a522ed0b9e556c5bf7ccadb4e83",
"/": "21748a522ed0b9e556c5bf7ccadb4e83",
"manifest.json": "d29b6b23a3a88e6788fc88a7208c7338"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
