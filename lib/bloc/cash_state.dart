// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cash_bloc.dart';

@immutable
abstract class CashState {
  Person person;
  CashState({
    required this.person,
  });
}

class CashInitialState extends CashState {
  CashInitialState({required super.person});
  
}

class CashUpdateState extends CashState {
  CashUpdateState({required super.person});
}
class InsufficientBalanceState extends CashState {
  InsufficientBalanceState({required super.person});
  
}