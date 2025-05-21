import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/data/datasources/models/passenger.module.dart';

class PassengerSearchDelegate extends SearchDelegate<Passenger?> {
  final List<Passenger> passengers;
  final Function(Passenger)? onPassengerSelected;

  PassengerSearchDelegate({required this.passengers, this.onPassengerSelected});

  @override
  String get searchFieldLabel => 'Buscar pasajero';

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(color: Colors.black87, fontSize: 16);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filtrar pasajeros basados en la consulta
    final results = _filterPassengers();

    if (results.isEmpty) {
      return _buildNoResultsFound();
    }

    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Si no hay consulta, mostrar sugerencias recientes o populares
    if (query.isEmpty) {
      return _buildInitialSuggestions();
    }

    // Filtrar pasajeros basados en la consulta para sugerencias
    final results = _filterPassengers();

    if (results.isEmpty) {
      return _buildNoResultsFound();
    }

    return _buildSearchResults(results);
  }

  // Método para filtrar pasajeros basados en la consulta
  List<Passenger> _filterPassengers() {
    final lowercaseQuery = query.toLowerCase();
    return passengers.where((passenger) {
      return passenger.name.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  // Widget para mostrar cuando no hay resultados
  Widget _buildNoResultsFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No se encontraron pasajeros',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Text(
            'Intenta con otro término de búsqueda',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  // Widget para mostrar sugerencias iniciales
  Widget _buildInitialSuggestions() {
    // Mostrar algunos pasajeros populares o recientes como sugerencias
    final suggestedPassengers = passengers.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Pasajeros recientes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suggestedPassengers.length,
            itemBuilder: (context, index) {
              final passenger = suggestedPassengers[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(passenger.name),
                onTap: () {
                  query = passenger.name;
                  showResults(context);
                  if (onPassengerSelected != null) {
                    onPassengerSelected!(passenger);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget para mostrar resultados de búsqueda
  Widget _buildSearchResults(List<Passenger> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final passenger = results[index];
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            passenger.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          onTap: () {
            close(context, passenger);
            if (onPassengerSelected != null) {
              onPassengerSelected!(passenger);
            }
          },
        );
      },
    );
  }
}
