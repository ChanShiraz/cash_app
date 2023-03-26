import 'package:bloc/bloc.dart';

import 'package:cash_app/modles/person.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cash_event.dart';
part 'cash_state.dart';

class CashBloc extends Bloc<CashEvent, CashState> {
  CashBloc()
      : super(CashInitialState(
            person: Person(name: 'name', balance: '0', cashToBeAdded: ''))) {    
    on<AddCashToAccountEvent>((event, emit) {
      double currentBalance = double.parse(state.person.balance);
      double ammountToBeAdded = double.parse(event.ammountToBeAdded);
      double totalBalanceAfterAdd = currentBalance + ammountToBeAdded;
      state.person.balance = totalBalanceAfterAdd.toString();
      state.person.cashToBeAdded = '';
      emit(CashUpdateState(person: state.person));
    });
    on<SendMoneyEvent>((event, emit) {
      double currentBalance = double.parse(state.person.balance);
      double amountToBeSend = double.parse(event.moneyToBeSend);
      double totalBalanceAfterSent = 0;
      if (currentBalance > amountToBeSend) {
        totalBalanceAfterSent = currentBalance - amountToBeSend;
        state.person.balance = totalBalanceAfterSent.toString();
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(content: Text('Insufficient Balance')));
        state.person.balance;
        emit(InsufficientBalanceState(person: state.person));
      }
      state.person.cashToBeAdded = '';
      emit(CashUpdateState(person: state.person));
    });
    on<TakingInputEvent>(
      ((event, emit) {
        // state as Person;
        state.person.cashToBeAdded = (state.person.cashToBeAdded + event.input);
        emit(CashUpdateState(person: state.person));
      }),
    );
    on<BackSpaceEvent>(
      ((event, emit) {
        String str = state.person.cashToBeAdded;
        if (str.isNotEmpty) {
          str = str.substring(0, str.length - 1);
        }
        state.person.cashToBeAdded = str;
        emit(CashUpdateState(person: state.person));
      }),
    );
  }
}
