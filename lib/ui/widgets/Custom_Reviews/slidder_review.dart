import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';

class StarRatingSlider extends StatefulWidget {
  const StarRatingSlider({super.key});

  @override
  State<StarRatingSlider> createState() => _StarRatingSliderState();
}

class _StarRatingSliderState extends State<StarRatingSlider> {
  double _rating = 2.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Star",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_rating.toStringAsFixed(1)}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 240,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.deepPurple,
                    inactiveTrackColor: Colors.grey.shade300,

                    trackHeight: 10.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10.0,
                    ),
                    overlayColor: Colors.deepPurple.withOpacity(0.1),
                    thumbColor: Colors.deepPurple,
                  ),
                  child: Slider(
                    value: _rating,
                    min: 0,
                    max: 5,
                    divisions: 50,
                    // 0.1 steps
                    label: _rating.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ),
              ),
              Text(
                '5.00',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 210),
          CustomButton(title: "Submit Review", onpress: () {}),
        ],
      ),
    );
  }
}
