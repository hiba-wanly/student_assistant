import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/core/utils/simple_bloc_observer.dart';
import 'package:student_register/featuers/home/data/data_source/local_data_source.dart';
import 'package:student_register/featuers/home/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/home/data/repo/repo_impl.dart';
import 'package:student_register/featuers/home/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/view/home.dart';
import 'package:get_it/get_it.dart';
import 'package:student_register/featuers/mysubject/data/data_source/subject_remote_data_source.dart';
import 'package:student_register/featuers/mysubject/data/repo/repo_impl.dart';
import 'package:student_register/featuers/mysubject/domain/use_case/ss_fetch_use_case.dart';
import 'package:student_register/featuers/mysubject/presentation/manager/cubit/subject_cubit.dart';
import 'package:student_register/repository.dart';
import 'package:student_register/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(StudentInfoModelAdapter());

  await Hive.openBox<Student>(kLoginBox);
  await Hive.openBox<StudentInfoModel>(kStudentInfoBox);

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
    Repository repository = Repository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context){
              return SSCubit(
                  FetchStudentUseCase(
                    RepoImpl(
                      remoteDataSource: RemoteDataSourceImpl(
                        getIt.get<ApiService>(),
                      ), loginLocalDataSource: LoginLocalDataSourceImpl(),
                    )
                  ),
                FetchStudentInfoUseCase(
                    RepoImpl(
                      remoteDataSource: RemoteDataSourceImpl(
                        getIt.get<ApiService>(),
                      ), loginLocalDataSource: LoginLocalDataSourceImpl(),
                    )
                ),
              );
            }),
        BlocProvider(
            create: (context){
              return SubjectCubit(
                  FetchSubjectUseCase(
                      SSRepoImpl(
                        ssremoteDataSource: SubjectRemoteDataSourceImpl(
                          getIt.get<ApiService>(),
                        ),
                      )
                  ),
                  FetchStudentSubjectUseCase(
                      SSRepoImpl(
                        ssremoteDataSource: SubjectRemoteDataSourceImpl(
                          getIt.get<ApiService>(),
                        ),
                      )
                  )
              );
            }),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner:false ,
      //   initialRoute: '/',
      //   routes: {
      //     AppRouter.kSplash: (context) => SplashScreen(repository: repository),
      //     AppRouter.kHomeView: (context) => HomeView(repository: repository),
      //      },
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
        ),
        home:  SplashScreen(repository: repository),
      ),
    );
  }
}
