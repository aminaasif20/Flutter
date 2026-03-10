const express = require('express');
const router = express.Router();
const Account = require('../models/Account');

// Create account
router.post('/', async (req, res) => {
  try {
    const account = new Account(req.body);
    await account.save();
    res.status(201).json(account);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Get all accounts
router.get('/', async (req, res) => {
  try {
    const accounts = await Account.find();
    res.json(accounts);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
