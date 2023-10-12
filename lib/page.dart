import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tên'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Text(
              'Bạn tên gì?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Tên',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Họ',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Email()),
                    );
                  },
                  child: const Text('Tiếp')),
            ),
          ],
        ),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Địa chỉ email'),
        
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Text(
              'Nhập địa chỉ email của bạn',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Địa chỉ Email',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: Text('Tiếp')
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mật khẩu'),
      ),
      body: const Column(
        children: [
          Text('Tạo mật khẩu cho tài khoản của bạn'),
          TextField(
            decoration: InputDecoration(
              labelText: 'Mật khẩu',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nhập lại mật khẩu',
            ),
          ),
          ElevatedButton(onPressed: null, child: Text('Tiếp')),
        ],
      ),
    );
  }
}
