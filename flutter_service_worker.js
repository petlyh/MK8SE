'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"version.json": "0b4946966e35a1bf24e79a1cb4e64b71",
"assets/AssetManifest.json": "5c5456658aeafbd99aad81091005c2b9",
"assets/assets/userdata-empty.dat": "fa595f15feeba8908da79b9e3b4c0232",
"assets/AssetManifest.bin": "1db9dcbab595dcd95ecdeddb06a6b9de",
"assets/fonts/MaterialIcons-Regular.otf": "7c5b46e68d8139f1bf03854da5403af9",
"assets/NOTICES": "bb50c83f409eadce1e378f1285ff5ec1",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"icons/Icon-maskable-192.png": "1f04a35e8ad9b6f477d26adcc79dcbbe",
"icons/Icon-512.png": "7e33bd5497c767ff5c5ab8b27bc2c1b4",
"icons/Icon-192.png": "1f04a35e8ad9b6f477d26adcc79dcbbe",
"icons/Icon-maskable-512.png": "7e33bd5497c767ff5c5ab8b27bc2c1b4",
"index.html": "3c4860986533cda555fd32d4b494794a",
"/": "3c4860986533cda555fd32d4b494794a",
"main.dart.js": "ee5fe604847d8fa81941adbcae74e842",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
".git/index": "03d040ce34bbc5cc3a094005930a963e",
".git/FETCH_HEAD": "35ceab7cfd40fbfe716e5a6da433fdfd",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/config": "fe117eb82c21fc4dabc0c07fd60c746b",
".git/refs/heads/gh-pages": "fc5338488ff114eb3ab19dfdcc63f63a",
".git/refs/remotes/origin/gh-pages": "fc5338488ff114eb3ab19dfdcc63f63a",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/01/bcca7d1c23955f7aeda6a269b1b7f540802096": "635a6822e2a56f7f333d54c66b0234db",
".git/objects/24/058fea30f8e6fb035da7918f76ba8cefca6ce6": "d52bef5f485ebc0e939baedbc328e8f2",
".git/objects/24/e980ad98cbcb8fdc32de65706235d173885dea": "8b3e61f92f9e7403f283268ea81bfbda",
".git/objects/e2/99facc2665c1732873e143dea8357243e674b7": "7050ebc723d6ff07507cee536bbdce29",
".git/objects/7e/20eb662bc132e8ef14722fa87771971f62a831": "92394693ef4d78522cc6aaa1b13f9ac8",
".git/objects/db/cc65ccca33dfa3b8f294f6e4fd6e39515a011f": "ad2260caf4313105f195015cdf69ee33",
".git/objects/4c/a2a7c226d2c3e26f0b9dde74214486d0baa896": "734657b1f27c72d07dd9e52a25c020c1",
".git/objects/96/5f268e91b7f468ea4ded85a8f2abcddfe1f5a9": "6cde620475753acf951a3fbb6b42aca1",
".git/objects/2f/ac5c0ef69d0e5ef77ee27cbc2eb515d60c4ade": "a537aa05c77a09192f1797759e61ff5a",
".git/objects/8a/e948e93636baaccd93f6ca5c8e1985ea4e6466": "9c119dd5521f239fff576206d0977ebb",
".git/objects/68/efdac51c02f6fd71273f87330b863898cd39a0": "c51d06f8acc53112111d51bf9a88d3b6",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/59/e15e5ecde692f7f7827be40948644e3e67eb12": "a17fc26a4cba6a3295e9ac5d71c6b774",
".git/objects/b1/0a857b741b64fb95ecc7b56ae78ef3cf4d565a": "28f141fbef936c4231fcb08c82ad48f6",
".git/objects/e8/55dc987b0db3ccd24a8869a087233a0e124f27": "9b242467f4dfe05ce7d2727a68a1ea66",
".git/objects/31/1f8c84424a28e2b9ff492953f7a845d332fb19": "8209f1cca218f57bd6135395b23bced0",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/49/7d7be727cf0cb53d71cabc0d47f10b2b9bb42a": "7308142d23f87e8737f87c99d86bcaf9",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/a8/d5e695887eacbad0a6a6cb77f0ff46beb8e1c1": "ca0e3a9a191bcac5686d93123532302d",
".git/objects/a8/234e78324011301c932efde8dd789fba10495a": "5ad9ca983e505191e13f526cf3be6ade",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/ff/a9945f8056a6bdb06022e626e2656482179b66": "b5bfff3e8e3b1d349d57c6732335f1f4",
".git/objects/f1/e65f2dfade400a0f91d99869c0ae6aa5973857": "bfa6b81c4ef7d91d8c89666a30bef283",
".git/objects/30/6dac5ed8d40c1a67b51105b2c459a386061bc3": "0a17491a92c8dee602194b7eabdb73a1",
".git/objects/30/0c8b053bb2e50b5081ae5714b4d2d50758134d": "60e7c9ad942456da9cb99992dd9ec087",
".git/objects/80/72605f6aea3b74bee2546e8a68e5c705e6cafa": "f3066bdd2c94c479eb81eb0e8fbb15a5",
".git/objects/bb/b715fad0fdcf014d85328ca0a1daedea77ed67": "b9d0991291802526aaaefd72edd56912",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/83/0e3d19e7f2ff19bbb4b955e3a38e3328837e12": "4412f19a8aebd49e1c2fb821b641e232",
".git/objects/da/3246ba115f7824d43fd842b40d4a64937f6c3d": "6e34fbd579d6a305912c05084457e76b",
".git/objects/5b/e3b873859168787902018e38fb49445c4b7add": "40ec5ea38f590dfa90897b1508ef1e04",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/shallow": "fc5338488ff114eb3ab19dfdcc63f63a",
".git/logs/refs/heads/gh-pages": "117c99b69452da8384e510cd7eeeaf78",
".git/logs/refs/remotes/origin/gh-pages": "a6c8330371913f28a643f60f131432e8",
".git/logs/HEAD": "5c0c4c85e9a1a795de6277751bf18b92",
"favicon.png": "e55f4c73328da6c13688e7235eec1c16",
"manifest.json": "d29b6b23a3a88e6788fc88a7208c7338"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
