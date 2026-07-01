# Smart Event Management Platform 

A Flutter mini-module that lets a user browse events, book tickets, and
manage their bookings — all persisted locally on the device using
shared_preferences.

## Features

### 1. Event Booking Screen
- Select an Event from a predefined list (each with a ticket price and
  available seat count).
- Enter User Name and Email Address (validated for format).
- Enter Number of Tickets (validated: required, must be greater than
  zero, cannot exceed available seats).
- Pick a Booking Date using a date picker.
- Choose a Payment Method (Credit Card, Debit Card, UPI, Cash) —
  required before a booking can be confirmed.
- Live price summary: Ticket Cost, 5% Service Charge, and Grand Total
  update automatically as the form is filled in.
- On confirmation, the booking is saved to local storage and the user is
  switched to the "My Bookings" tab.

### 2. Local Storage
- LocalStorageService wraps shared_preferences and provides:
  - Save / check / clear a simple login session.
  - Add, list, and delete bookings (stored as JSON strings).
- All booking data survives app restarts since it's written to disk.

### 3. My Bookings Screen
- Displays every saved booking as a card: Event Name, Booking ID, Booking
  Date, Number of Tickets, Total Amount, and Status.
- Cancel Booking button removes the booking from local storage (with a
  confirmation dialog) and refreshes the list.
- Pull-to-refresh support.

### 4. User Page (entry point)
- A "Booking" menu item opens the unified Booking Management screen,
  which combines "New Booking" and "My Bookings" as tabs in a single
  interface.

## Project Structure

event_booking/
├── pubspec.yaml
└── lib/
    ├── main.dart                     # App entry point
    ├── local_storage_service.dart    # shared_preferences wrapper
    ├── models/
    │   └── booking.dart              # Booking model + event catalog
    └── screens/
        ├── user_page.dart            # User page + Booking Management (tabs)
        ├── booking_screen.dart       # New booking form
        └── my_bookings_screen.dart   # Bookings list + cancel


