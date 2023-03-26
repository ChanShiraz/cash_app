import 'package:cash_app/bloc/cash_bloc.dart';
import 'package:cash_app/constants/colors.dart';
import 'package:cash_app/extension_on_context.dart';
import 'package:cash_app/screens/add_money.dart';
import 'package:cash_app/screens/send_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  late CashBloc cashBloc;
  @override
  Widget build(BuildContext context) {
    cashBloc = context.read<CashBloc>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: context.height / 3,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 30, 30),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Availbe Balance',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        BlocBuilder(
                          bloc: cashBloc,
                          builder: (context, state) {
                            if (state is CashUpdateState) {
                              return Text(
                                '\$ ${state.person.balance}',
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                            } else {
                              return const Text(
                                '\$0',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MoneyWidget2(
                              text: 'Add Cash',
                              onClick: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddMoneyScreen(),
                              )),
                            ),
                            MoneyWidget2(
                              text: 'Send Cash',
                              onClick: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SendMoneyScreen(),
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 110,
                      width: context.width / 5,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 30, 30),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dollar Rate',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '0.2%',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 110,
                      width: context.width / 5,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 30, 30),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Crypto Market',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '0.01%',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView(
                children: [
                  HistoryWidget(
                    icon: const Icon(
                      Icons.call_received,
                      color: Colors.green,
                    ),
                    text1: 'Received',
                    text2: '+\$100',
                  ),
                  HistoryWidget(
                    icon: const Icon(
                      Icons.call_made_sharp,
                      color: Colors.red,
                    ),
                    text1: 'Sent',
                    text2: '-\$50',
                  ),
                  HistoryWidget(
                    icon: const Icon(
                      Icons.call_received,
                      color: Colors.green,
                    ),
                    text1: 'Received',
                    text2: '+\$10',
                  ),
                  HistoryWidget(
                    icon: const Icon(
                      Icons.call_made,
                      color: Colors.red,
                    ),
                    text1: 'Sent',
                    text2: '-\$60',
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

//history widget
class HistoryWidget extends StatelessWidget {
  HistoryWidget(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2});
  Widget icon;
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 31, 30, 30),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            Text(
              text1,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              text2,
              style: const TextStyle(color: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}

//money widgets
class MoneyWidget2 extends StatelessWidget {
  MoneyWidget2({super.key, required this.text, required this.onClick});
  String text;
  VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//money widgets
class MoneyWidget extends StatelessWidget {
  MoneyWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.onClick});
  String label;
  IconData icon;
  VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: context.height / 6,
        width: context.width / 6,
        decoration: BoxDecoration(
            color: mySecondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
