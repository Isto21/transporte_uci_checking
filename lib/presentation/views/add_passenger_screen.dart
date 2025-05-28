import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/passenger_providers.dart';

class AddPassengerScreen extends ConsumerStatefulWidget {
  final int tripId;

  const AddPassengerScreen({super.key, required this.tripId});

  @override
  ConsumerState<AddPassengerScreen> createState() => _AddPassengerScreenState();
}

class _AddPassengerScreenState extends ConsumerState<AddPassengerScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos del formulario
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _selectedGender = 'Masculino';
  String _selectCenter = 'CIGED';
  bool _hasSpecialNeeds = false;
  String _specialNeedsDescription = '';

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _idNumberController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // En un caso real, aquí enviarías los datos a la API
      // Por ahora, solo simulamos la adición y volvemos a la pantalla anterior

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pasajero añadido correctamente'),
          backgroundColor: Colors.green,
        ),
      );
      ref
          .read(passnegerProvider.notifier)
          .addPassenger(
            UserEnity(
              email: _emailController.text,
              name: _nameController.text,
              lastName: _lastNameController.text,
            ),
          );
      // Volver a la pantalla anterior después de un breve retraso
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Pasajero')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Información Personal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ApkConstants.primaryApkColor,
                ),
              ),
              const SizedBox(height: 16),

              // Nombre
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Apellido
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Número de identificación
              TextFormField(
                controller: _idNumberController,
                decoration: const InputDecoration(
                  labelText: 'Número de Identificación',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de identificación';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Género
              DropdownButtonFormField<String>(
                value: _selectCenter,
                decoration: const InputDecoration(
                  labelText: 'Centro de producción',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city_outlined),
                ),
                items:
                    ['CIGED', 'CISOL', 'CIGE', 'FORTES', 'VERTEX', 'CESIM'].map(
                      (gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      },
                    ).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectCenter = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              const Text(
                'Información de Contacto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ApkConstants.primaryApkColor,
                ),
              ),
              const SizedBox(height: 16),

              // Género
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Género',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                items:
                    ['Masculino', 'Femenino', 'Otro'].map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedGender = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              // Teléfono
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const Text(
                'Necesidades Especiales',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ApkConstants.primaryApkColor,
                ),
              ),
              const SizedBox(height: 16),

              // Tiene necesidades especiales
              SwitchListTile(
                title: const Text('Tiene necesidades especiales'),
                value: _hasSpecialNeeds,
                onChanged: (value) {
                  setState(() {
                    _hasSpecialNeeds = value;
                  });
                },
                tileColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              const SizedBox(height: 16),

              // Descripción de necesidades especiales (solo visible si _hasSpecialNeeds es true)
              if (_hasSpecialNeeds)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descripción de necesidades especiales',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.accessibility),
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    _specialNeedsDescription = value;
                  },
                ),
              const SizedBox(height: 32),

              // Botón de enviar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Añadir Pasajero',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
