const mongoose = require('mongoose');

const TransactionSchema = new mongoose.Schema({
  description: { type: String, required: true },
  amount: { type: Number, required: true },
  date: { type: Date, default: Date.now },
  debitAccountId: { type: mongoose.Schema.Types.ObjectId, ref: 'Account', required: true },
  creditAccountId: { type: mongoose.Schema.Types.ObjectId, ref: 'Account', required: true },
  type: { type: String, enum: ['Journal', 'Invoice', 'Payment', 'Expense'], default: 'Journal' },
});

module.exports = mongoose.model('Transaction', TransactionSchema);
