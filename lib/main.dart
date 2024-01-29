import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/fetch_more_movies/fetch_more_movie_provider.dart';

import 'all_movies/all_movies_provider.dart';
import 'last_update/last_update_provider.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LastUpdateProvider()),
        ChangeNotifierProvider(create: (_) => AllMoviesProvider()),
        ChangeNotifierProvider(create: (_) => FetchMoreMoviesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
