const express = require('express');
const router = express.Router();
const Transaction = require('../models/Transaction');
const Account = require('../models/Account');

// Create Transaction
router.post('/', async (req, res) => {
  const { debitAccountId, creditAccountId, amount, description } = req.body;
  try {
    // Basic Double Entry Logic: Update account balances
    await Account.findByIdAndUpdate(debitAccountId, { $inc: { balance: amount } });
    await Account.findByIdAndUpdate(creditAccountId, { $inc: { balance: -amount } });

    const transaction = new Transaction(req.body);
    await transaction.save();
    res.status(201).json(transaction);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Get transactions
router.get('/', async (req, res) => {
  try {
    const transactions = await Transaction.find().populate('debitAccountId creditAccountId');
    res.json(transactions);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
