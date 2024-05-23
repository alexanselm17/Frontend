import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title:
            Text("Withdraw", style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Add padding inside the Scaffold
          child: Column(
            children: [
              const SizedBox(height: 10, width: 0),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Add border radius
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 4, 183, 49),
                    Color.fromARGB(255, 2, 135, 35),
                    Color.fromARGB(255, 1, 109, 28),
                    Color.fromARGB(255, 1, 94, 24),
                  ]),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Balance>',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Text(
                      'Ksh 456,892.01',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount (Ksh)',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Withdraw to:'),
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('M-Pesa'),
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Flexisave'),
                    value: 2,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Sacco Wallet'),
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20), // Add border radius
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 4, 183, 49),
                          Color.fromARGB(255, 2, 135, 35),
                          Color.fromARGB(255, 1, 109, 28),
                          Color.fromARGB(255, 1, 94, 24),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(
                      child: Text(
                        'Withdraw Cash',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
