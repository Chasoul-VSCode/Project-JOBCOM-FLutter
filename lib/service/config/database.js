const admin = require('firebase-admin');
const { initializeApp } = require('firebase/app');

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCgj2RPK-DJuJmdv3gZEh0lNcNeg0nlVT4",
  authDomain: "project-jobcom.firebaseapp.com",
  projectId: "project-jobcom",
  storageBucket: "project-jobcom.firebasestorage.app",
  messagingSenderId: "1016051960361",
  appId: "1:1016051960361:web:b5ed5c1c08ce1e16bcaa38",
  measurementId: "G-1JWJ8GL4QH"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Firebase Admin
const serviceAccount = require('../serviceAccountKey.json');
try {
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
  }, 'admin');
} catch (error) {
  console.error('Error initializing Firebase Admin:', error);
  // Log the service account content (but remove sensitive data first)
  console.log('Service account format:', {
    ...serviceAccount,
    private_key: serviceAccount.private_key ? 'EXISTS' : 'MISSING',
    client_email: serviceAccount.client_email ? 'EXISTS' : 'MISSING'
  });
}

const db = admin.firestore();

module.exports = { admin, db, app };
