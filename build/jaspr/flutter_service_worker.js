'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "59f2aaa50bd18d63e5732a596c9fa2da",
"version.json": "045f8d3e4471f25c4d8d805f9205fd38",
"favicon.ico": "efec2cd56fe3a9bd55ef3925f247797c",
"index.html": "98ffae2cd949781a8467832bde64e0a5",
"/": "98ffae2cd949781a8467832bde64e0a5",
"images/email_marketing.png": "9e503dc9a44dcc12835f182dd74324a5",
"images/content_creation.png": "f707f033e43dd6aef32313676c87e312",
"images/anylytics_and_tracking.png": "4aed43259bf325099f14cac01e6a57bc",
"images/learn_more_green_icon.svg": "6cf0a5c96e5930f7980d5ea14df94576",
"images/image_header.png": "dfbc3ddd0bebc9a13e5aae3366c868cc",
"images/cta_block_image.png": "58970e852e569b1b3f39ac062391e46f",
"images/icon_primary_web.svg": "bc8ab1317396adb42136b82a95a4d31a",
"images/close-svgrepo-com.svg": "9be664b63e1dbd6ca7767d4ec4b76da4",
"images/instagram_icon.png": "5fdcc7e2539ae399d856f2c318d222d0",
"images/arrow_up_right.svg": "24d44fddad874833382c40c4f92295f0",
"images/pay_per_click_advertising.png": "1e8cc9407add62a4dc78ad1ec90966bd",
"images/image_contact_us_card.png": "890d62ed5f5101c6714f8ab4c9701a1f",
"images/social_media_marketing.png": "5455e822e39a5305ad7280d662a5bd7f",
"images/drillble_icon.png": "d0d8d1c9eda0fd20c5cb629f73459469",
"images/facebook_icon.png": "ec673d09d4dd232887fbb9dbf7fd4142",
"images/search_engine_optimization.png": "6b1641e079092f8e017b6e0fea272db2",
"images/amazon_icon.png": "f815875f0c8505b24d569c65dd8dcfb2",
"images/notion_icon.png": "38e92c378b2598c48f433388f84e2ea4",
"images/menu-svgrepo-com.svg": "3edd1b02df911d06adbf4385d47a9b00",
"images/logo.svg": "7e0c9a5e4fb10e2226ae7e1283e57d1c",
"images/hubspot_icon.png": "89d037e06c40f03231438a0753e17b1d",
"images/netflix_icon.png": "3b70b1ee9670e748050544204549dc13",
"images/twitter_icon.png": "475db7f374b5104d8dae7935d60dc234",
"images/member_team.png": "4f887bb42a8103ab86b79d722106aab6",
"images/zoom_icon.png": "75e2c42e9cc2a4d8dc5a91f718a3d91e",
"images/x_cross.png": "709a44efdeeaece354b9eb42d8b4e18c",
"main.dart.js": "245d5cae7d54e90de009727417ace96f",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5044cf5e702dbcad35c35a1186142dee",
"assets/AssetManifest.json": "f0cb0120e81fddba270aec38b652ebe1",
"assets/NOTICES": "5b1977739426bb11732d1a5ab2364493",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "587f5697ebf2c628becc6ad71826e054",
"assets/packages/flutter_sound/assets/js/tau_web.js": "32cc693445f561133647b10d1b97ca07",
"assets/packages/flutter_sound/assets/js/async_processor.js": "1665e1cb34d59d2769956d2f14290274",
"assets/packages/flutter_sound_web/howler/howler.js": "3030c6101d2f8078546711db0d1a24e9",
"assets/packages/flutter_sound_web/src/flutter_sound_recorder.js": "9577d05877a98f5fb37373c42dfb28c7",
"assets/packages/flutter_sound_web/src/flutter_sound_player.js": "debd8fcb36cb849ae16bc7255a7a9414",
"assets/packages/flutter_sound_web/src/flutter_sound.js": "eb4cdd20dfeacbf387a31bd9977cadb8",
"assets/packages/flutter_sound_web/src/async_processor.js": "1665e1cb34d59d2769956d2f14290274",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "356bcfeddb8a625e3e2ba43ddf1cc13e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "91703cc661e4ea0ae84b0ff1a37c67bd",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/translations/ja.json": "54b6c203875f09c0f54d01d5c80f623a",
"assets/assets/translations/en.json": "e09b6f47a34c4f815919be346a43a3d9",
"assets/assets/translations/ko.json": "c32b1d7eaef51675629ea6aed7b812ea",
"assets/assets/translations/vi.json": "1c25b0386d5204adc713794da58fa78f",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
