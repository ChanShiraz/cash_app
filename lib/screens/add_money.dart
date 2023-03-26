import 'package:cash_app/bloc/cash_bloc.dart';
import 'package:cash_app/constants/colors.dart';
import 'package:cash_app/extension_on_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key});
  late CashBloc cashBloc;
  late String cashToBeAdd;
  @override
  Widget build(BuildContext context) {
    cashBloc = context.read<CashBloc>();
    return Scaffold(
      backgroundColor: myDimBlackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              'Add Money',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.height / 40, horizontal: 10),
              child: SizedBox(
                height: context.height / 4,
                child: Center(
                  child: BlocBuilder(
                    bloc: cashBloc,
                    builder: (context, state) {
                      if (state is CashUpdateState) {
                        return Text(
                          '\$ ${state.person.cashToBeAdded}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        );
                      } else {
                        return const Text(
                          '\$ 0',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            NumbersWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: BlocListener<CashBloc, CashState>(
                listener: (context, state) {
                  cashToBeAdd = state.person.cashToBeAdded;
                },
                child: InkWell(
                  onTap: () {
                    cashBloc.add(
                        AddCashToAccountEvent(ammountToBeAdded: cashToBeAdd));
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Cash added successfully')));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//numbers widget
class NumbersWidget extends StatelessWidget {
  NumbersWidget({super.key});
  late CashBloc cashBloc;
  @override
  Widget build(BuildContext context) {
    cashBloc = context.read<CashBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          height: context.height / 2.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextButton(
                    text: '1',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '1'));
                    },
                  ),
                  MyTextButton(
                    text: '2',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '2'));
                    },
                  ),
                  MyTextButton(
                    text: '3',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '3'));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextButton(
                    text: '4',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '4'));
                    },
                  ),
                  MyTextButton(
                    text: '5',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '5'));
                    },
                  ),
                  MyTextButton(
                    text: '6',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '6'));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextButton(
                    text: '7',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '7'));
                    },
                  ),
                  MyTextButton(
                    text: '8',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '8'));
                    },
                  ),
                  MyTextButton(
                    text: '9',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '9'));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextButton(
                    text: '.',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '.'));
                    },
                  ),
                  MyTextButton(
                    text: '0',
                    onClick: () {
                      cashBloc.add(TakingInputEvent(input: '0'));
                    },
                  ),
                  MyTextButton(
                    text: '<',
                    onClick: () {
                      cashBloc.add(BackSpaceEvent());
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

//sigel button widget
class MyTextButton extends StatelessWidget {
  MyTextButton({super.key, required this.text, required this.onClick});
  String text;
  VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
