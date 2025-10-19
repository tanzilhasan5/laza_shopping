import 'package:flutter/material.dart';
import 'package:otp_resend_timer/otp_resend_timer.dart';

class OtpTimmer extends StatefulWidget {
  const OtpTimmer({super.key,});

  @override
  State<OtpTimmer> createState() => _OtpTimmerState();
}

class _OtpTimmerState extends State<OtpTimmer> {
  late OtpResendTimerController _controller;
  final TextEditingController _otpController = TextEditingController();
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    _controller = OtpResendTimerController(initialTime: 10);
  }

  @override
  void dispose() {
    _controller.dispose();
    _otpController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onResendClicked() {
    // Resend OTP logic here
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OtpResendTimer(
        controller: _controller,
        onResendClicked: _onResendClicked,
        autoStart: true,
        timerMessage: '',
        readyMessage: '',
        holdMessage: 'Start timer to enable resend',
        resendMessage: 'Resend  confirmation code.',
        timerMessageStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: 12,
        ),
        resendMessageStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: 12,
        ),
      ),
    );
  }
}