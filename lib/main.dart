import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/blocs/news/news_bloc.dart';
import 'package:forestvpn_test/pages/news/list_news_page.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/theme/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final mockNewsRepository = MockNewsRepository();

  runApp(ForestVPNTestApp(
    mockNewsRepository: mockNewsRepository,
  ));
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({
    Key? key,
    required MockNewsRepository mockNewsRepository,
  })
      : _mockNewsRepository = mockNewsRepository,
        super(key: key);

  final MockNewsRepository _mockNewsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(mockNewsRepository: _mockNewsRepository)..add(GetNewsEvent()),
      child: MaterialApp(
        title: 'ForestVPN test',
        home: ListNewsPage(),
      ),
    );
  }
}
