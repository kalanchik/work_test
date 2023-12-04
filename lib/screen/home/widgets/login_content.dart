import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginContent({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Чтобы войти в личный кабинет\nНажмите кнопку войти',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onLogin,
              child: const Text('Войти'),
            ),
          ],
        ),
      ],
    );
  }
}
