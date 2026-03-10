const mongoose = require('mongoose');

const InvoiceItemSchema = new mongoose.Schema({
  description: { type: String, required: true },
  quantity: { type: Number, required: true },
  unitPrice: { type: Number, required: true },
  total: { type: Number, required: true },
});

const InvoiceSchema = new mongoose.Schema({
  customerName: { type: String, required: true },
  items: [InvoiceItemSchema],
  totalAmount: { type: Number, required: true },
  dueDate: { type: Date, required: true },
  isPaid: { type: Boolean, default: false },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Invoice', InvoiceSchema);
