import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/core/utils/simple_bloc_observer.dart';
import 'package:student_register/featuers/home/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/home/data/repo/repo_impl.dart';
import 'package:student_register/featuers/home/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/view/home.dart';
import 'package:get_it/get_it.dart';
void main() {
  runApp(const MyApp());
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context){
              return SSCubit(
                  FetchStudentUseCase(
                    RepoImpl(
                      remoteDataSource: RemoteDataSourceImpl(
                        getIt.get<ApiService>(),
                      )
                    )
                  ),
                  FetchSubjectUseCase(
                      RepoImpl(
                          remoteDataSource: RemoteDataSourceImpl(
                            getIt.get<ApiService>(),
                          )
                      )
                  )
              );
            })
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner:false ,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
        ),
        home:  HomeView(),
      ),
    );
  }
}
