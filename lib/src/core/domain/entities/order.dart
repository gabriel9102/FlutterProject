import 'package:objectbox/objectbox.dart';

@Entity()
class OrderMaster {
  @Id()

  int id = 0;
  final String description;
  final DateTime date;

  OrderMaster({
    required this.description,
    required this.date
  });

}