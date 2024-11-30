const express = require('express');
const router = express.Router();
const { admin, db } = require('../config/database');

// Create new user registration
router.post('/register', async (req, res) => {
  try {
    const { name, email, password, specialization, location } = req.body;

    // Validate required fields
    if (!name || !email || !password || !specialization || !location) {
      return res.status(400).json({ error: 'All fields are required' });
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({ error: 'Invalid email format' });
    }

    // Validate password length
    if (password.length < 6) {
      return res.status(400).json({ error: 'Password must be at least 6 characters' });
    }

    // Validate specialization is from allowed list
    const validSpecializations = [
      'Programmer',
      'Graphic Designer', 
      'IT Admin',
      'UI/UX Designer',
      'System Analyst',
      'Network Engineer',
      'Database Administrator',
      'Other'
    ];

    if (!validSpecializations.includes(specialization)) {
      return res.status(400).json({ error: 'Invalid specialization' });
    }

    // Create user in Firebase Auth
    const userRecord = await admin.auth().createUser({
      email: email,
      password: password,
      displayName: name
    });

    // Store additional user data in Firestore
    await db.collection('users').doc(userRecord.uid).set({
      name: name,
      email: email,
      specialization: specialization,
      location: location,
      createdAt: new Date()
    });

    res.status(201).json({
      message: 'User registered successfully',
      userId: userRecord.uid
    });

  } catch (error) {
    console.error('Error registering user:', error);
    
    // Handle specific Firebase Auth errors
    if (error.code === 'auth/email-already-exists') {
      return res.status(400).json({ error: 'An account already exists for this email' });
    }
    
    res.status(500).json({ error: error.message });
  }
});

// Get user profile
router.get('/user/:id', async (req, res) => {
  try {
    const userDoc = await db.collection('users').doc(req.params.id).get();
    
    if (!userDoc.exists) {
      return res.status(404).json({ error: 'User not found' });
    }

    res.json(userDoc.data());
  } catch (error) {
    console.error('Error fetching user:', error);
    res.status(500).json({ error: error.message });
  }
});

// Update user profile
router.put('/user/:id', async (req, res) => {
  try {
    const { name, specialization, location } = req.body;
    
    // Validate required fields
    if (!name || !specialization || !location) {
      return res.status(400).json({ error: 'All fields are required' });
    }

    await db.collection('users').doc(req.params.id).update({
      name: name,
      specialization: specialization,
      location: location,
      updatedAt: new Date()
    });

    res.json({ message: 'User updated successfully' });
  } catch (error) {
    console.error('Error updating user:', error);
    res.status(500).json({ error: error.message });
  }
});

// Delete user
router.delete('/user/:id', async (req, res) => {
  try {
    // Delete from Firebase Auth
    await admin.auth().deleteUser(req.params.id);
    
    // Delete from Firestore
    await db.collection('users').doc(req.params.id).delete();

    res.json({ message: 'User deleted successfully' });
  } catch (error) {
    console.error('Error deleting user:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
