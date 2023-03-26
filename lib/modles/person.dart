import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String name;
  String balance;
  String cashToBeAdded;
  Person({
    required this.name,
    required this.balance,
    required this.cashToBeAdded,
  });


  Person copyWith({
    String? name,
    String? balance,
    String? cashToBeAdded,
  }) {
    return Person(
      name: name ?? this.name,
      balance: balance ?? this.balance,
      cashToBeAdded: cashToBeAdded ?? this.cashToBeAdded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'balance': balance,
      'cashToBeAdded': cashToBeAdded,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      balance: map['balance'] as String,
      cashToBeAdded: map['cashToBeAdded'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Person(name: $name, balance: $balance, cashToBeAdded: $cashToBeAdded)';

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.balance == balance &&
      other.cashToBeAdded == cashToBeAdded;
  }

  @override
  int get hashCode => name.hashCode ^ balance.hashCode ^ cashToBeAdded.hashCode;
}
