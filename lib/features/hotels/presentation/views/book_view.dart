import 'package:flutter/material.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/features/hotels/data/models/book_model.dart/hotel_book_model.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_confirmation.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/date_picker.dart';

class BookHotelView extends StatefulWidget {
  const BookHotelView({super.key, required this.hotel});
  static const String id = 'BookHotelView';
  final Properties hotel;

  @override
  State<BookHotelView> createState() => _BookHotelViewState();
}

class _BookHotelViewState extends State<BookHotelView> {
  // Controllers
  final ValueNotifier<DateTime> checkInDateController =
      ValueNotifier<DateTime>(DateTime(2025, 12, 5));
  final ValueNotifier<DateTime> checkOutDateController =
      ValueNotifier<DateTime>(DateTime(2025, 12, 7));
  final ValueNotifier<int> roomsController = ValueNotifier<int>(1);
  final ValueNotifier<int> adultsController = ValueNotifier<int>(1);
  final ValueNotifier<int> childrenController = ValueNotifier<int>(0);
  final ValueNotifier<int> infantsController = ValueNotifier<int>(0);
  final ValueNotifier<String?> errorMessageController =
      ValueNotifier<String?>(null);

  // Constraints
  static const int minRooms = 1;
  static const int maxRooms = 10;
  static const int minAdults = 1;
  static const int maxAdults = 20;
  static const int minChildren = 0;
  static const int maxChildren = 10;
  static const int minInfants = 0;
  static const int maxInfants = 10;
  static const int maxTotalGuests = 20;

  @override
  void dispose() {
    checkInDateController.dispose();
    checkOutDateController.dispose();
    roomsController.dispose();
    adultsController.dispose();
    childrenController.dispose();
    infantsController.dispose();
    errorMessageController.dispose();
    super.dispose();
  }

  // Validate all inputs
  bool _validateInputs() {
    // Check date validity
    if (checkOutDateController.value.isBefore(checkInDateController.value) ||
        checkOutDateController.value
            .isAtSameMomentAs(checkInDateController.value)) {
      errorMessageController.value =
          'Check-out date must be after check-in date';
      return false;
    }

    // Check room count
    if (roomsController.value < minRooms || roomsController.value > maxRooms) {
      errorMessageController.value =
          'Rooms must be between $minRooms and $maxRooms';
      return false;
    }

    // Check adult count
    if (adultsController.value < minAdults ||
        adultsController.value > maxAdults) {
      errorMessageController.value =
          'Adults must be between $minAdults and $maxAdults';
      return false;
    }

    // Check children count
    if (childrenController.value < minChildren ||
        childrenController.value > maxChildren) {
      errorMessageController.value =
          'Children must be between $minChildren and $maxChildren';
      return false;
    }

    // Check infants count
    if (infantsController.value < minInfants ||
        infantsController.value > maxInfants) {
      errorMessageController.value =
          'Infants must be between $minInfants and $maxInfants';
      return false;
    }

    // Check total guests
    final totalGuests = adultsController.value +
        childrenController.value +
        infantsController.value;
    if (totalGuests > maxTotalGuests) {
      errorMessageController.value =
          'Total guests cannot exceed $maxTotalGuests';
      return false;
    }

    errorMessageController.value = null;
    return true;
  }

  Widget _buildGuestSelector(
    String title,
    String subtitle,
    ValueNotifier<int> countController,
    int minCount,
    int maxCount,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: countController.value <= minCount
                  ? null
                  : () {
                      countController.value--;
                      _validateInputs();
                    },
              icon: const Icon(Icons.remove_circle, color: Colors.orange),
            ),
            ValueListenableBuilder<int>(
              valueListenable: countController,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: countController.value >= maxCount
                  ? null
                  : () {
                      countController.value++;
                      _validateInputs();
                    },
              icon: const Icon(Icons.add_circle, color: Colors.orange),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<DateTime>(
              valueListenable: checkInDateController,
              builder: (context, checkInDate, child) {
                return ValueListenableBuilder<DateTime>(
                  valueListenable: checkOutDateController,
                  builder: (context, checkOutDate, child) {
                    return DatePickerWidget(
                      checkInDate: checkInDate,
                      checkOutDate: checkOutDate,
                      onCheckInChanged: (date) {
                        checkInDateController.value = date;
                        _validateInputs();
                      },
                      onCheckOutChanged: (date) {
                        checkOutDateController.value = date;
                        _validateInputs();
                      },
                    );
                  },
                );
              },
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 8),
            _buildGuestSelector(
              'Number of rooms',
              '',
              roomsController,
              minRooms,
              maxRooms,
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 8),
            _buildGuestSelector(
              'Adults',
              'Ages 18 or Above',
              adultsController,
              minAdults,
              maxAdults,
            ),
            _buildGuestSelector(
              'Children',
              'Ages 6 - 17',
              childrenController,
              minChildren,
              maxChildren,
            ),
            _buildGuestSelector(
              'Infants',
              'Under Ages 2',
              infantsController,
              minInfants,
              maxInfants,
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 8),
            ValueListenableBuilder<String?>(
              valueListenable: errorMessageController,
              builder: (context, errorMessage, child) {
                return errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          errorMessage,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<String?>(
              valueListenable: errorMessageController,
              builder: (context, errorMessage, child) {
                return CustomButton(
                  title: 'Continue',
                  onTap: errorMessage != null || !_validateInputs()
                      ? null
                      : () {
                          final bookOrder = HotelBookModel(
                            checkIn: checkInDateController.value.toString(),
                            checkOut: checkOutDateController.value.toString(),
                            noRooms: roomsController.value,
                            guest: (adultsController.value +
                                childrenController.value +
                                infantsController.value),
                          );
                          Navigator.pushNamed(
                            context,
                            BookConfirmation.id,
                            arguments: {
                              'hotelBookModel': bookOrder,
                              'properties': widget.hotel,
                            },
                          );
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
