import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class LayeredGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data, ensure consistency according to the logic mentioned above
    List<double> stress = List<double>.filled(100, 100.0);  // Red area data
    List<double> relax = List<double>.filled(100, 70.0);    // Green area data
    List<double> thoughts = List<double>.filled(100, 40.0); // Blue area data
    List<double> calm = List<double>.filled(100, 50.0);     // Black line data
    List<double> hr = List<double>.filled(100, 30.0);       // Blue line data

    return Scaffold(
      appBar: AppBar(title: Text('Layered Graph')),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          child: Stack(
            children: [
              Sparkline(
                lineColor: Colors.red.shade200,
                data: stress,
                fillMode: FillMode.above,
                fillColor: Colors.red.shade200,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              ),
              Sparkline(
                lineColor: Colors.green.shade200,
                data: relax,
                fillMode: FillMode.below,
                fillColor: Colors.green.shade200,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              ),
              Sparkline(
                lineColor: Colors.blue.shade200,
                data: thoughts,
                fillMode: FillMode.below,
                fillColor: Colors.blue.shade200,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              ),
              Sparkline(
                lineColor: Colors.black,
                data: calm,
                lineWidth: 2,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              ),
              Sparkline(
                lineColor: Colors.blue.shade900,
                data: hr,
                lineWidth: 2,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}