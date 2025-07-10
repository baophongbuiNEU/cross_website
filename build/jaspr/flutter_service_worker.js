'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "91703cc661e4ea0ae84b0ff1a37c67bd",
"assets/AssetManifest.bin.json": "587f5697ebf2c628becc6ad71826e054",
"assets/AssetManifest.json": "f0cb0120e81fddba270aec38b652ebe1",
"assets/assets/translations/en.json": "ce072d5da3600715be457baea1ac021c",
"assets/assets/translations/ja.json": "f9d889103cb2bf024d71b16750db148d",
"assets/assets/translations/ko.json": "2120596938539ec9053cfffa289f9e7b",
"assets/assets/translations/vi.json": "aebb1adebe8b315775c8477e8bef3ca7",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "6b926f9ea461767ede29c33834e44f5a",
"assets/packages/flutter_sound/assets/js/async_processor.js": "1665e1cb34d59d2769956d2f14290274",
"assets/packages/flutter_sound/assets/js/tau_web.js": "32cc693445f561133647b10d1b97ca07",
"assets/packages/flutter_sound_web/howler/howler.js": "3030c6101d2f8078546711db0d1a24e9",
"assets/packages/flutter_sound_web/src/async_processor.js": "1665e1cb34d59d2769956d2f14290274",
"assets/packages/flutter_sound_web/src/flutter_sound.js": "eb4cdd20dfeacbf387a31bd9977cadb8",
"assets/packages/flutter_sound_web/src/flutter_sound_player.js": "debd8fcb36cb849ae16bc7255a7a9414",
"assets/packages/flutter_sound_web/src/flutter_sound_recorder.js": "9577d05877a98f5fb37373c42dfb28c7",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "356bcfeddb8a625e3e2ba43ddf1cc13e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.ico": "efec2cd56fe3a9bd55ef3925f247797c",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "72735a0238daff616b3cbdab32a8d15b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"images/amazon_icon.png": "f815875f0c8505b24d569c65dd8dcfb2",
"images/anylytics_and_tracking.png": "4aed43259bf325099f14cac01e6a57bc",
"images/arrow_up_right.svg": "604c170ec26c75ef275024f4bc170254",
"images/B%C3%B9i%20B%E1%BA%A3o%20Phong.JPG": "5f8b14718d0280f98d7ef9089397cd92",
"images/close-svgrepo-com.svg": "6fc442f217f76defb954db57d5d501ab",
"images/collab_image.svg": "a73938e032eb3c0fb27b0a34e77fca2e",
"images/content_creation.png": "f707f033e43dd6aef32313676c87e312",
"images/cross_teambuilding.jpg": "e4b36160f0814f377c40b877b65b0e0d",
"images/cta_block_image.png": "58970e852e569b1b3f39ac062391e46f",
"images/dangtung.png": "24433116399380446994f9699c211ff8",
"images/demo_primary_image.png": "8bcf426baf8273ec273a36e24a77bb8b",
"images/drillble_icon.png": "d0d8d1c9eda0fd20c5cb629f73459469",
"images/education_image.svg": "d7668963241e262d9603431abb59038a",
"images/email_marketing.png": "9e503dc9a44dcc12835f182dd74324a5",
"images/employee_supply_image.svg": "efe8a8640fea232ee8a727d53ea6b306",
"images/facebook_icon.png": "ec673d09d4dd232887fbb9dbf7fd4142",
"images/flags/jp.svg": "889c5f736a5e5b66501c710c137d9e8e",
"images/flags/kr.svg": "59dfc8e0872b88e75d2bb09496931f89",
"images/flags/us.svg": "5d1062823ef3a7aab856c54546273a0c",
"images/flags/vn.svg": "28dbb9cb0ded8f2410a4cb5a33674ab7",
"images/hubspot_icon.png": "89d037e06c40f03231438a0753e17b1d",
"images/icon_primary_web.svg": "7bf38091ece8777320d0260a57654331",
"images/image_contact_us_card.png": "890d62ed5f5101c6714f8ab4c9701a1f",
"images/image_header.png": "dfbc3ddd0bebc9a13e5aae3366c868cc",
"images/instagram_icon.png": "5fdcc7e2539ae399d856f2c318d222d0",
"images/intheoffice_image.svg": "9cffd51e735225d906a636e9aadd7e9e",
"images/ited.jpg": "91342ea4adea60580685750eedcc9db0",
"images/LaiXeVanXuan.jpg": "752a075ff165fe99ff62ed24f2a41945",
"images/learn_more_blue_icon.svg": "519e5c39641b95a602b36c0d2a1330e8",
"images/learn_more_green_icon.svg": "f2c77d0789b1a27ae2595815ed6cba67",
"images/Le%CC%82%20Vie%CC%A3%CC%82t%20Hu%CC%80ng.jpeg": "d96ef79a26e0ba48d6e71334c27db515",
"images/logo.svg": "1388455bbe50160ef66151969592bc2d",
"images/member_team.png": "4f887bb42a8103ab86b79d722106aab6",
"images/menu-svgrepo-com.svg": "6ecfc7069439782da0bf65f9645e68c6",
"images/mission.png": "0eb57d0412c39a25274e4ed0a536b60f",
"images/mobile_image.svg": "ae779245eca88f9bbb4ae90337fd273b",
"images/moon.svg": "a00a4c3f4ff38745113d4dbb1b8fd553",
"images/netflix_icon.png": "3b70b1ee9670e748050544204549dc13",
"images/NguyenQuyenAnh.png": "c6001205ba06e263d146b014ce5954f0",
"images/notion_icon.png": "38e92c378b2598c48f433388f84e2ea4",
"images/office.jpg": "d823289f31662179dbe0d6ff640efe92",
"images/office1.jpg": "044aaf7a8dd519aa20a78b84e26f0591",
"images/pay_per_click_advertising.png": "1e8cc9407add62a4dc78ad1ec90966bd",
"images/philosophy.png": "5d6c9cee4a2dff1779f4a68e1c724729",
"images/Ph%C3%B9ng%20Quang%20Huy.JPG": "092029ce4ad30571b8b5d9730a74d1a4",
"images/programing_image.svg": "890a47b16140ba15a3ed72a53b0076d2",
"images/search_engine_optimization.png": "6b1641e079092f8e017b6e0fea272db2",
"images/social_media_marketing.png": "5455e822e39a5305ad7280d662a5bd7f",
"images/sun.svg": "bee8df5f9a88cf3e229fb56b50741f01",
"images/twitter_icon.png": "475db7f374b5104d8dae7935d60dc234",
"images/undraw_business-deal_nx2n.svg": "7ed869d9d0045e27d39781e94d8c6889",
"images/vfast.png": "b06779531c04ddd02ca4eb155f20d047",
"images/viettran.png": "248d54162c0ce6d6f67a639b498cd052",
"images/vision.png": "2a666fa2b2042ad66f35c7b38eb3b690",
"images/web_image.svg": "494af14e71db7c24bb761d0a4c940423",
"images/x_cross.png": "709a44efdeeaece354b9eb42d8b4e18c",
"images/zoom_icon.png": "75e2c42e9cc2a4d8dc5a91f718a3d91e",
"index.html": "24ef52c885d8b888dc1603b6b2e7ffd8",
"/": "24ef52c885d8b888dc1603b6b2e7ffd8",
"main.dart.js": "60c09b4d1eefc51a4c9b9b9babf1d0a2",
"manifest.json": "d73523157ff5c7a248d76131cdc7d323",
"version.json": "da1ebd65845d69442300fffc98a6ebc8"};
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
