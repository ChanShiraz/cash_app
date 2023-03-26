// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cash_bloc.dart';

@immutable
abstract class CashEvent {}


@immutable
class AddCashToAccountEvent extends CashEvent {
  String ammountToBeAdded;
  AddCashToAccountEvent({
    required this.ammountToBeAdded,
  });
}

@immutable
class TakingInputEvent extends CashEvent {
  String input;
  TakingInputEvent({
    required this.input,
  });
}

@immutable
class SendMoneyEvent extends CashEvent {
  String moneyToBeSend;
  BuildContext context;
  SendMoneyEvent({required this.moneyToBeSend, required this.context});
}

@immutable
class BackSpaceEvent extends CashEvent {}
@immutable
class LoadDbCashEvent extends CashEvent {}