import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/assets_path.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/authentication/confirm_pin.dart';
import 'package:shop0koa_frontend/view/screens/navigation.dart';

class NewPin extends StatefulWidget {
  static const routeName = 'NewPin';
  const NewPin({super.key});

  @override
  _ConfirmPinState createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<NewPin> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String enteredPin = '';
  bool isPinVisible = false;
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  /// this widget will be use for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () async {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();
            }
          });
          if (enteredPin.length == 4) {
            Navigator.of(context).pushNamed(NavigationPage.routeName);
            // showDialog(
            //   context: context,
            //   barrierDismissible: false,
            //   builder: (context) => const CustomProgressDialog(
            //     status: "Confirming Pin..",
            //   ),
            // );
            // var res =
            //     await _currentAccService.confirmPin(pin: enteredPin.trim());
            // Navigator.pop(context);
            // if (res.body == "true") {
            //   Navigator.pop(context, "yes");
            // } else {
            //   Navigator.pop(context, 'no');
            // }
          } else {
            // _scaffoldKey.currentState.showSnackBar(SnackBar(
            //     content: Text("Please enter your Pin"),
            //     duration: Duration(seconds: 3)));
          }
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(
            image: const AssetImage(AssetsPath.logo),
            width: MediaQuery.of(context).size.width - 90,
          ),
          SizedBox(height: size.height * 0.05),
          Text('Create a login Pin'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20, // Adjust font size as needed
                fontWeight: FontWeight.bold,
              )),

          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// visiblity toggle button
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       isPinVisible = !isPinVisible;
                //     });
                //   },
                //   icon: Icon(
                //     isPinVisible ? Icons.visibility_off : Icons.visibility,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// pin code area
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return Container(
                    margin: const EdgeInsets.all(6.0),
                    width: size.width * 0.13,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: !isPinVisible
                              ? AppColors.mainColor
                              : Colors.white),
                      borderRadius: BorderRadius.circular(30.0),
                      color: index < enteredPin.length
                          ? isPinVisible
                              ? Colors.green
                              : Colors.white
                          : Colors.white,
                    ),
                    child: Center(
                      child: isPinVisible && index < enteredPin.length
                          ? Text(
                              enteredPin[index],
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : !isPinVisible && index < enteredPin.length
                              ? Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.mainColor,
                                  ),
                                )
                              // const Text(
                              //     "*",
                              //     style: TextStyle(
                              //         fontSize: 28, color: Colors.white),
                              //   )

                              : null,
                    ));
              },
            ),
          ),
          SizedBox(height: size.height * 0.09),

          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => numButton(1 + 3 * i + index),
                ).toList(),
              ),
            ),

          /// 0 digit with back remove
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextButton(onPressed: null, child: SizedBox()),
                numButton(0),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        if (enteredPin.isNotEmpty) {
                          enteredPin =
                              enteredPin.substring(0, enteredPin.length - 1);
                        }
                      },
                    );
                  },
                  child: const Icon(
                    Icons.backspace,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            // padding: 15,
            //color: AppColors.mainColor,
            onTap: () {
              Navigator.of(context).pushNamed(ConfirmPin.routeName);
            },
            text: 'CREATE PIN',
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
