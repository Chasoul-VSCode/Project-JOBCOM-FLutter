const express = require('express');
const { initializeApp, cert } = require('firebase-admin/app');
const { getAuth } = require('firebase-admin/auth');
const registerRoutes = require('./routes/RegisterRoutes');

// Initialize Firebase Admin with service account credentials
const serviceAccount = require('../config/serviceAccountKey.json');
initializeApp({
  credential: cert(serviceAccount)
});

const app = express();
app.use(express.json());

// Routes
app.get('/', (req, res) => {
  res.status(200).json({ 
    status: 'success',
    message: 'Server is connected and running'
  });
});

app.use('/api', registerRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});