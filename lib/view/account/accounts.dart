import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _balanceVisibility = false;

  void _toggleBalanceVisibility() {
    setState(() {
      _balanceVisibility = !_balanceVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
        title: const Text('Your Account'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/logo.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text("Kahawa Sukari Naivas", style: theme.textTheme.displaySmall),
              Container(
                width: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verified",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.sizeOf(context).height * .2,
                width: MediaQuery.sizeOf(context).width * .8,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Your Balance',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: _toggleBalanceVisibility,
                            icon: Icon(
                              _balanceVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * .1,
                        width: MediaQuery.sizeOf(context).width * .7,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: _balanceVisibility
                              ? Container(
                                  color: Colors.grey,
                                )
                              : const Text(
                                  "Ksh 234,567.01",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                ),
                onPressed: () {},
                child: const Text("Withdraw From Wallet"),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                onTap: () {
                  debugPrint("Contact");
                },
                leading: const Icon(
                  Icons.call,
                  semanticLabel: 'contact Us',
                ),
                title: const Text("Contact Us"),
              ),
              ListTile(
                onTap: () {
                  debugPrint("Abuse");
                },
                leading: const Icon(
                  Icons.report,
                  semanticLabel: 'report abuse',
                ),
                title: const Text("Report Abuse"),
              ),
              ListTile(
                onTap: () {
                  print("feedback");
                },
                leading: const Icon(Icons.feedback),
                title: const Text("Submit Feddback"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
