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
"flutter_bootstrap.js": "f2324fa73ab0182fc1c4891b71f8335a",
"version.json": "0b4946966e35a1bf24e79a1cb4e64b71",
"favicon.png": "e55f4c73328da6c13688e7235eec1c16",
"main.dart.js": "619bf3173cc25d030090de2f3839e04e",
"assets/NOTICES": "4888931873cda14e6d4867869e2beec9",
"assets/AssetManifest.bin": "e8e6bd90071492e511ace5bda72a2b94",
"assets/assets/userdata-empty.dat": "fa595f15feeba8908da79b9e3b4c0232",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "fac6e2f9522d5bdead501d3488467845",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "24ad42857030b8d8b5bec2b78f11c59a",
"assets/AssetManifest.json": "8a8e2e2b110f23c7dd54ef13930e0b6c",
".git/index": "e94d8d689a9e9c7466192b608be1cf07",
".git/FETCH_HEAD": "b1f9a266f02a5dc482bcfabc9ebe7843",
".git/logs/HEAD": "09c22a565cb7cf68af06d2bf1ff2910c",
".git/logs/refs/heads/gh-pages": "406b4a2b440a868c2c7d24e859882759",
".git/logs/refs/remotes/origin/gh-pages": "04721ebe9e100bef08a3354ebd342136",
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
".git/shallow": "740a03ebd22b8e2edc4860d66ed18011",
".git/config.worktree": "f0198bfdba75fcb121daecc3fa77420b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/objects/4c/a2a7c226d2c3e26f0b9dde74214486d0baa896": "734657b1f27c72d07dd9e52a25c020c1",
".git/objects/2f/ac5c0ef69d0e5ef77ee27cbc2eb515d60c4ade": "a537aa05c77a09192f1797759e61ff5a",
".git/objects/24/e980ad98cbcb8fdc32de65706235d173885dea": "8b3e61f92f9e7403f283268ea81bfbda",
".git/objects/24/058fea30f8e6fb035da7918f76ba8cefca6ce6": "d52bef5f485ebc0e939baedbc328e8f2",
".git/objects/31/1f8c84424a28e2b9ff492953f7a845d332fb19": "8209f1cca218f57bd6135395b23bced0",
".git/objects/db/cc65ccca33dfa3b8f294f6e4fd6e39515a011f": "ad2260caf4313105f195015cdf69ee33",
".git/objects/83/f73486a87e82d3f888c47db17ab63e07bc21ee": "a099e2eadbcfa5eca4418a099ab2ba19",
".git/objects/83/0e3d19e7f2ff19bbb4b955e3a38e3328837e12": "4412f19a8aebd49e1c2fb821b641e232",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3a/4deb323eb5d98a071e27a975f0471552e76e6e": "70e0f86c63b57646182b2bce5a8bb5c8",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/8b/4a4876017880a650eb38da066a2ba4f41b4714": "3ede150995cebe7e38aff79554503f44",
".git/objects/e8/55dc987b0db3ccd24a8869a087233a0e124f27": "9b242467f4dfe05ce7d2727a68a1ea66",
".git/objects/30/6dac5ed8d40c1a67b51105b2c459a386061bc3": "0a17491a92c8dee602194b7eabdb73a1",
".git/objects/4a/6cfacd91dd2d4dd18f5a299b09a0fb113cefa9": "4a719d4bfb455533f5a993253b050863",
".git/objects/a8/234e78324011301c932efde8dd789fba10495a": "5ad9ca983e505191e13f526cf3be6ade",
".git/objects/a8/d5e695887eacbad0a6a6cb77f0ff46beb8e1c1": "ca0e3a9a191bcac5686d93123532302d",
".git/objects/e2/99facc2665c1732873e143dea8357243e674b7": "7050ebc723d6ff07507cee536bbdce29",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/bd/e5f899a1eabec237584872b236918529d7652b": "a37a5213e70f316e1f67e997e34ff4ac",
".git/objects/bb/b715fad0fdcf014d85328ca0a1daedea77ed67": "b9d0991291802526aaaefd72edd56912",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/01/bcca7d1c23955f7aeda6a269b1b7f540802096": "635a6822e2a56f7f333d54c66b0234db",
".git/objects/96/5f268e91b7f468ea4ded85a8f2abcddfe1f5a9": "6cde620475753acf951a3fbb6b42aca1",
".git/objects/79/f7af10716bc93c5f47230155c17abab5ce28d6": "8241e24adfee6f5c6532329be76e353d",
".git/objects/7e/20eb662bc132e8ef14722fa87771971f62a831": "92394693ef4d78522cc6aaa1b13f9ac8",
".git/objects/05/e63e43ffc8a5877534707518b5a0514d53273f": "07c74ed21d8f2e7015a9eddf5aa62d38",
".git/objects/8a/e948e93636baaccd93f6ca5c8e1985ea4e6466": "9c119dd5521f239fff576206d0977ebb",
".git/objects/68/efdac51c02f6fd71273f87330b863898cd39a0": "c51d06f8acc53112111d51bf9a88d3b6",
".git/objects/cd/af6539e907ccf005263abacaec94437e51ab79": "d21053cab1a0c4b1bb23b80e17e15767",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/97/8e5277b75e59dd2f4d5f483ed3fa33a9e00388": "a0304d729883a83e3f102f6079ffdf54",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/config": "1688ba14b9cff189a435dbfa3e37060b",
".git/refs/heads/gh-pages": "740a03ebd22b8e2edc4860d66ed18011",
".git/refs/remotes/origin/gh-pages": "740a03ebd22b8e2edc4860d66ed18011",
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
