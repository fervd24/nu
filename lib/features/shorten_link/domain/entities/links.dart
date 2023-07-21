// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Links extends Equatable{

  final String self;
  final String short;
  
  const Links({
    required this.self,
    required this.short,
  });
  
  @override
  List<Object?> get props => [self, short];
}
