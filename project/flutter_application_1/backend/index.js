const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes (to be defined)
const accountRoutes = require('./routes/accounts');
const transactionRoutes = require('./routes/transactions');
const invoiceRoutes = require('./routes/invoices');

app.use('/api/accounts', accountRoutes);
app.use('/api/transactions', transactionRoutes);
app.use('/api/invoices', invoiceRoutes);

// Database connection (Using a dummy local URI if not provided)
const dbUri = process.env.MONGO_URI || 'mongodb://localhost:27017/accounting_db';
mongoose.connect(dbUri)
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
