// The name of my cache
const cacheName = "PWA-Exeboard-test-cache@v0.1";
//The files I'm going to cache
const filesToCache = [
  "/",
  "index.html",
  '/manifest.json',
  '/imgs/icons/User.svg',
];

self.addEventListener("install", e => {
  console.log("[ServiceWorker] - Install");
  // e.waitUntil((async () => {
  //   const cache = await caches.open(cacheName);
  //   console.log("[ServiceWorker] - Caching app shell");
  //   await cache.addAll(filesToCache);
  // })());
});

self.addEventListener("activate", e => {
  console.log("[ServiceWorker] - Activate");
  // e.waitUntil((async () => {
  //   // Get a list of all your caches in your app
  //   const keyList = await caches.keys();
  //   await Promise.all(
  //     keyList.map(key => {
  //       console.log(key);
  //       /* 
  //          Compare the name of your current cache you are iterating through
  //          and your new cache name
  //       */
  //       if (key !== cacheName) {
  //         console.log("[ServiceWorker] - Removing old cache", key);
  //         return caches.delete(key);
  //       }
  //     })
  //   );
  // })());
  // e.waitUntil(self.clients.claim());
});

// service-worker.js
self.onmessage = (e) => {
	console.log("Message received", e);
	if (e.data === "notify") {
		console.log("Creating notification...")
			const notifTitle = "Random notification appears";
			const notifBody = `ElrohirGT`;
			const notifImg = `/imgs/icons/Car.svg`;
			const options = {
				body: notifBody,
				icon: notifImg,
			};
			new Notification(notifTitle, options);
	}
};


// service-worker.js
// addEventListener("message", (e) => {
// 	console.log("Message received", e);
// 	if (e.data === "notify") {
// 		console.log("Creating notification...")
// 	/* Display notification */
// 			const notifTitle = "Random notification appears";
// 			const notifBody = `ElrohirGT`;
// 			const notifImg = `/imgs/icons/Car.svg`;
// 			const options = {
// 				body: notifBody,
// 				icon: notifImg,
// 			};
// 			new Notification(notifTitle, options);
// 	}
// });
