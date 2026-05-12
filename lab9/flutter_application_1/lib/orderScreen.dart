import 'package:flutter/material.dart';
import 'package:flutter_application_1/confirmationScreen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late final TextEditingController _customerNameController;
  String discountCode = "";
  String? errorText;
  String selectedSize = "Medium";

  final List<String> sizes = ["Small", "Medium", "Large", "Party Size"];

  @override
  void initState() {
    super.initState();
    _customerNameController = TextEditingController();
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        title: const Text(
          "SMT Cuisine 🍕",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Ready to Order? 😋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Fill in the details below to get your hot pizza!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 8,
                shadowColor: Colors.purple.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      /// 🧍 Customer Name (Task 1)
                      TextField(
                        controller: _customerNameController,
                        decoration: InputDecoration(
                          labelText: "Customer Name",
                          hintText: "Enter customer name",
                          prefixIcon: const Icon(Icons.person, color: Colors.purple),
                          filled: true,
                          fillColor: Colors.purple.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.purple, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// 🎟 Discount Code (Task 2)
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Discount Code",
                          hintText: "Enter promo code",
                          prefixIcon: const Icon(Icons.discount, color: Colors.purple),
                          errorText: errorText,
                          filled: true,
                          fillColor: Colors.purple.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.purple, width: 2),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            discountCode = value;
                            if (value.contains(" ")) {
                              errorText = "Don't use blank spaces";
                            } else {
                              errorText = null;
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      /// 🍕 Dropdown (Task 3)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          value: selectedSize,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: const Icon(Icons.local_pizza, color: Colors.purple),
                          dropdownColor: Colors.purple.shade50,
                          style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          items: sizes.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSize = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// 🚀 Submit Button (Task 4)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.purple.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(
                        name: _customerNameController.text,
                        size: selectedSize,
                      ),
                    ),
                  );

                  if (result == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "✅ Order Confirmed!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Submit Order",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}