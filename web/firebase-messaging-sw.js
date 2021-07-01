// console.log("")

importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");
firebase.initializeApp({
        apiKey: "AIzaSyCLVrx3uaY7p9ljBftXIrrCc5411TesNtw",
        authDomain: "flutter-core-d62da.firebaseapp.com",
        projectId: "flutter-core-d62da",
        storageBucket: "flutter-core-d62da.appspot.com",
        messagingSenderId: "7707386288",
        appId: "1:7707386288:web:b07cba9cab1b066a4e7675",
        measurementId: "G-VL5SLY4DRF"
});
const messaging = firebase.messaging();
// messaging.setBackgroundMessageHandler(function (payload) {
//     const promiseChain = clients
//         .matchAll({
//             type: "window",
//             includeUncontrolled: true
//         })
//         .then(windowClients => {
//             for (let i = 0; i < windowClients.length; i++) {
//                 const windowClient = windowClients[i];
//                 windowClient.postMessage(payload);
//             }
//         })
//         .then(() => {
//             const title = payload.notification.title;
//             const options = {
//                 body: payload.notification.score
//               };
//             return registration.showNotification(title, options);
//         });
//     return promiseChain;
// });
// self.addEventListener('notificationclick', function (event) {
//     console.log('notification received: ', event)
// });