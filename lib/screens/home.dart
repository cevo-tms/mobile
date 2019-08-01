import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  FormField<String> _buildFormField(String _text, List<String> _values) {
    String _currentSelectedValue = '';
    if (_values[0] != ''){
      _values.insert(0, '');
    }
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: _text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none)),
          isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                  state.didChange(newValue);
                });
              },
              items: _values.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Position position = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              zoomGesturesEnabled: false,
              tiltGesturesEnabled: false,
              compassEnabled: false,
              mapToolbarEnabled: false,
              indoorViewEnabled: false,
              rotateGesturesEnabled: false,
              myLocationEnabled: true,
              scrollGesturesEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 12.0,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    Material(elevation: 5.0, borderRadius: BorderRadius.circular(5.0), child: _buildFormField('Select Origin', [''])),
                    SizedBox(height: 15.0),
                    Material(elevation: 5.0, borderRadius: BorderRadius.circular(5.0), child: _buildFormField('Select Destination', [''])),
                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}