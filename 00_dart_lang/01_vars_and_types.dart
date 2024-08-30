/**
 * Topics to demonstrate:
 * 
 * - Static typing
 * - Type inference
 * - Type casting (type conversion)
 * - Type test operators
 * - Null safety
 * - Generics
 */

void main() {
  simpleTypes();
  nullableTypes();
  complexTypes();
  constAndFinalVars();
}

/*****************************************************************************/

void simpleTypes() {
  // try declaring the following with `var` and initializing them with `null`
  int inum = 42;
  double fpnum = 3.14;
  String snum = '442';

  print('inum.runtimeType = ${inum.runtimeType}');
  print('fpnum.runtimeType = ${fpnum.runtimeType}');
  print('snum.runtimeType = ${snum.runtimeType}');

  // different types
  // inum = fpnum;
  // fpnum = inum;

  // type casting
  fpnum = inum as double; // type casting -- won't work!!

  // explicit type conversions -- does work!!
  inum = fpnum.toInt();
  fpnum = inum.toDouble();

  // more type conversions
  // inum = int.parse(snum);
  // snum = inum.toString();
}

/*****************************************************************************/

void nullableTypes() {
  int n = 10; // try initializing with `null`

  print('n.runtimeType = ${n.runtimeType}');

  print(n == null);

  print(n?.abs()); // `?.` is the null-aware `.` operator

  print(10 + n??0); // `??` takes a default value if the first operand is null
}

/*****************************************************************************/

void complexTypes() {
  var inum = 42;
  var fpnum = 3.14;
  var snum = '442';

  // what are the inferred types of the following?
  var listOfNum     = [inum, fpnum, -5, 0.01]; // list of num-class objects
  var listOfStr     = [snum, 'mobile', 'app', 'dev'];
  var listOfAll     = [inum, fpnum, snum]; // list of Objects
  var listOfUnknown = []; // could hold anything -- dynamic! not good coding covention
  var listOfStr2    = <String>[]; // List<String>

  print('listOfNum.runtimeType = ${listOfNum.runtimeType}');
  print('listOfStr.runtimeType = ${listOfStr.runtimeType}');
  print('listOfAll.runtimeType = ${listOfAll.runtimeType}');
  print('listOfUnknown.runtimeType = ${listOfUnknown.runtimeType}');
  print('listOfStr2.runtimeType = ${listOfStr2.runtimeType}');

  print(listOfNum[0] + 10);
  print(listOfAll[0] is int); // you can check to see if an object is a specific subclass!
  print((listOfAll[0] as int) + 10);

  // print(listOfStr[0].length);
  // print(listOfAll[2] is String);
  // print(listOfAll[2].length); // how to fix this?

  // listOfUnknown.add('dart');
  // listOfUnknown.add(42);
  // listOfUnknown.add(null);
  // print(listOfUnknown[0].length);
  // print(listOfUnknown[1].length);

  // listOfStr2.add('flutter');
  // listOfStr2.add(42); // is this possible?
  // listOfStr2.add(null); // is this possible?
  // print(listOfStr2[0].length);
}

void constAndFinalVars() {
  var i = 42;
  var l = [1, 2, 3];

  // i = 43;
  l.add(4);

  final j = 42;
  final m = [1, 2, 3];

  // j = 43; -- cannot be changed
  m.add(4); // can add attributes to mutable objects

  const k = 42;
  const n = [1, 2, 3];

  var y = 42;

  // k = 43; -- cannot be changed
  // n.add(4); -- will produce an error! can't add to an unmodifiable list
  print("Hello!");
  print(identical(i, y)); // are they the same object in memory? they are!
  print(identical(m, n));
  print(identical([1, 2, 3], [1, 2, 3]));
  print(identical(const [1, 2, 3], const [1, 2, 3]));
  print(identical(m, const [1, 2, 3]));

  // Equivalent values that are immutable (like ints) point to each other in memory
  // Equivalent values that aren't immutable don't unless they are const.

  // Final keeps you from replacing the value (but allows you to modify mutable objects)
  // Constant makes something immutable

  // Compile-time constants always get reused!
}
