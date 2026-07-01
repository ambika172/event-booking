import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'my_bookings_screen.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Module')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.event_seat, color: Colors.indigo),
              title: const Text('Booking'),
              subtitle: const Text('View, add, or cancel your event bookings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BookingManagementScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Single, unified interface for the Booking Management System:
/// lets the user add new bookings and view/cancel existing ones.
class BookingManagementScreen extends StatefulWidget {
  const BookingManagementScreen({super.key});

  @override
  State<BookingManagementScreen> createState() =>
      _BookingManagementScreenState();
}

class _BookingManagementScreenState extends State<BookingManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<MyBookingsScreenState> _myBookingsKey =
      GlobalKey<MyBookingsScreenState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.add_circle_outline), text: 'New Booking'),
            Tab(icon: Icon(Icons.list_alt), text: 'My Bookings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BookingScreen(
            onBookingConfirmed: () {
              _myBookingsKey.currentState?.refresh();
              _tabController.animateTo(1);
            },
          ),
          MyBookingsScreen(key: _myBookingsKey),
        ],
      ),
    );
  }
}
