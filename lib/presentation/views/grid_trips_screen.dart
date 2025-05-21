// import 'package:flutter/material.dart';
// import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
// import 'package:transporte_uci_checking/presentation/views/passenger_list_screen.dart';
// import 'package:transporte_uci_checking/presentation/widgets/trip_grid_card.dart';

// class GridTripsScreen extends StatelessWidget {
//   const GridTripsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample data with some dates as placeholders
//     // final List<Trip> trips = [
//     //   Trip(date: '20/05/25', passengers: 18, time: '8:00'),
//     //   Trip(date: '20/05/25', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     //   Trip(date: 'dd/mm/aa', passengers: 18, time: '8:00'),
//     // ];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Mis Viajes')),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: 5, // Number of date groups
//         itemBuilder: (context, dateIndex) {
//           // Get the date for this group
//           String date = dateIndex == 0 ? '20/05/25' : 'dd/mm/aa';

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                 child: Text(
//                   date,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               GridView.count(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.5,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: List.generate(
//                   dateIndex == 0 ? 2 : 2, // Number of trips per date
//                   (index) => GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const PassengerListScreen(

//                           ),
//                         ),
//                       );
//                     },
//                     child: TripGridCard(
//                       trip: Trip(
//                         departureTime: DateTime.now().toString(),
//                         returnTime: DateTime.now().toString(),

//                         date: date,
//                         //  passengers: 18, time: '8:00'
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
