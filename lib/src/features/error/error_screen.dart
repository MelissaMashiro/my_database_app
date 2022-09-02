import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/theme/theme.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    this.buttonText,
    Key? key,
    this.message,
    this.onPressed,
    this.showAppBar = true,
    this.title,
  }) : super(key: key);

  final String? buttonText;
  final String? message;
  final VoidCallback? onPressed;
  final bool showAppBar;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title ?? 'Error Inesperado'),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(
          Spacing.medium,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: Spacing.xlarge * 2,
              ),
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 50.0,
              ),
              const SizedBox(
                height: Spacing.xlarge,
              ),
              Text(
                message ?? 'Ha ocurrido un error inesperado',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              if (buttonText?.isNotEmpty == true && onPressed != null) ...[
                const SizedBox(
                  height: Spacing.xlarge,
                ),
                RoundedButton(
                  text: buttonText!,
                  onTap: onPressed,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
