import 'dart:io';

List<Map<String, dynamic>> cars = [];
List<Map<String, String>> customers = [];
List<Map<String, dynamic>> rentals = [];

void addCar(String carId, String brand, String model, double basePricePerDay) {
  cars.add({
    'carId': carId,
    'brand': brand,
    'model': model,
    'basePricePerDay': basePricePerDay,
    'isAvailable': true
  });
}

void addCustomer(String customerId, String name) {
  customers.add({
    'customerId': customerId,
    'name': name
  });
}

void rentCar(String carId, String customerId, int days) {
  for (var car in cars) {
    if (car['carId'] == carId && car['isAvailable'] == true) {
      car['isAvailable'] = false;
      rentals.add({
        'carId': carId,
        'customerId': customerId,
        'days': days
      });
      print('\nCar rented successfully.');
      return;
    }
  }
  print('Car is not available for rent or invalid car ID.');
}

void returnCar(String carId) {
  Map<String, dynamic>? rentalToRemove;
  for (var rental in rentals) {
    if (rental['carId'] == carId) {
      rentalToRemove = rental;
      break;
    }
  }

  if (rentalToRemove != null) {
    rentals.remove(rentalToRemove);
    for (var car in cars) {
      if (car['carId'] == carId) {
        car['isAvailable'] = true;
        break;
      }
    }
    print('Car returned successfully.');
  } else {
    print('Car was not rented or invalid car ID.');
  }
}

void rentCarMenu() {
  print('\n== Rent a Car ==\n');
  stdout.write('Enter your name: ');
  String customerName = stdin.readLineSync() ?? '';

  print('\nAvailable Cars:');
  for (var car in cars) {
    if (car['isAvailable'] == true) {
      print("${car['carId']} - ${car['brand']} ${car['model']}");
    }
  }

  stdout.write('\nEnter the car ID you want to rent: ');
  String carId = stdin.readLineSync() ?? '';

  stdout.write('Enter the number of days for rental: ');
  int? rentalDays = int.tryParse(stdin.readLineSync() ?? '');
  if (rentalDays == null) {
    print('Invalid input for rental days.');
    return;
  }

  String customerId = 'CUS${customers.length + 1}';
  addCustomer(customerId, customerName);

  for (var car in cars) {
    if (car['carId'] == carId && car['isAvailable'] == true) {
      double totalPrice = car['basePricePerDay'] * rentalDays;
      print('\n== Rental Information ==\n');
      print('Customer ID: $customerId');
      print('Customer Name: $customerName');
      print('Car: ${car['brand']} ${car['model']}');
      print('Rental Days: $rentalDays');
      print('Total Price: \Rs:${totalPrice.toStringAsFixed(2)}');

      stdout.write('\nConfirm rental (Y/N): ');
      String confirm = stdin.readLineSync() ?? '';
      if (confirm.toLowerCase() == 'y') {
        rentCar(carId, customerId, rentalDays);
      } else {
        print('\nRental canceled.');
      }
      return;
    }
  }
  print('\nInvalid car selection or car not available for rent.');
}

void returnCarMenu() {
  print('\n== Return a Car ==\n');
  stdout.write('Enter the car ID you want to return: ');
  String carId = stdin.readLineSync() ?? '';

  returnCar(carId);
}

void menu() {
  while (true) {
    print('===== Car Rental System =====');
    print('1. Rent a Car');
    print('2. Return a Car');
    print('3. Exit');
    stdout.write('Enter your choice: ');

    int? choice = int.tryParse(stdin.readLineSync() ?? '');
    if (choice == null) {
      print('Invalid input. Please enter a valid number.');
      continue;
    }

    switch (choice) {
      case 1:
        rentCarMenu();
        break;
      case 2:
        returnCarMenu();
        break;
      case 3:
        print('Thank you for using the Car Rental System!');
        return;
      default:
        print('Invalid choice. Please enter a valid option.');
    }
  }
}

void main() {
  addCar('CK3', 'KIA', 'Sportage', 7500.0);
  addCar('CGG', 'HONDA', 'Civic', 5500.0);
  addCar('CP0', 'HONDA', 'City', 4500.0);
  addCar('CX9', 'HONDA', 'Accord', 1700.0);
  addCar('CD7', 'TOYOTA', 'Fortuner', 12000.0);
  addCar('C0Q', 'TOYOTA', 'Camry', 1600.0);
  addCar('CJI', 'TOYOTA', 'Vitz', 4500.0);
  addCar('CAW', 'TOYOTA', 'Prado', 6500.0);
  addCar('CZX', 'SUZUKI', 'Alto', 3500.0);
  addCar('CT3', 'SUZUKI', 'Cultus', 5500.0);

  menu();
}