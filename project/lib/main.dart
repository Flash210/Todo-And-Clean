import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:project/features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<CrudBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostsPage(),
      ),
    );
  }
}

//? when the app run we send an event to the bloc and the will talk to use case and use case talk to repository 
//? and the repository will talk to the data source if there is a net will talk with remote data source if there is no net will talk with local data source
/*else will go to local data source and get the data and send it to the repository and the repository will send it to the use case 
and the use case will send it to the bloc and the bloc will send it to the ui*/
