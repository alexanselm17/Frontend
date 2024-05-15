import 'package:flutter/material.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
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
              SizedBox(height: 10, width: 0),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF34C759),
                      Color(0xFF34C759),
                      Color(0xFF000000).withOpacity(0.6),
                      Color(0xFF000000).withOpacity(0.5),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Balance>',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Text(
                      'Ksh 4568927',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount (Ksh)',
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Withdraw to:'),
              ),
              Column(
                children: [
                  RadioListTile(
                    title: Text('M-Pesa'),
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('Flexisave'),
                    value: 2,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('Sacco Wallet'),
                    value: 3,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Add border radius
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF34C759),
                          Color(0xFF34C759),
                          Color(0xFF000000).withOpacity(0.6),
                          Color(0xFF000000).withOpacity(0.5),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Center(
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
