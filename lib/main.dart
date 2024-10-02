import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/core/utils/simple_bloc_observer.dart';
import 'package:student_register/featuers/add_subject/data/data_source/subject_remote_data_source.dart';
import 'package:student_register/featuers/add_subject/data/repo/repo_impl.dart';
import 'package:student_register/featuers/add_subject/domain/use_case/ss_fetch_use_case.dart';
import 'package:student_register/featuers/add_subject/presentation/manager/cubit/subject_cubit.dart';
import 'package:student_register/featuers/attendance/data/data_source/attendance_remote_data_source.dart';
import 'package:student_register/featuers/attendance/data/repos/attendance_repo_impl.dart';
import 'package:student_register/featuers/attendance/domain/use_cases/fetch_attendance_use_case.dart';
import 'package:student_register/featuers/attendance/presentations/manager/attendance_cubit/attendance_cubit.dart';
import 'package:student_register/featuers/auth/data/data_source/auth_remote_data_source.dart';
import 'package:student_register/featuers/auth/data/repos/auth_repo_impl.dart';
import 'package:student_register/featuers/auth/domain/use_cases/fetch_login_use_case.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/departments/data/data_source/department_remote_data_source.dart';
import 'package:student_register/featuers/departments/data/repos/department_repo_impl.dart';
import 'package:student_register/featuers/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_register/featuers/my_subject/data/data_source/home_remote_data_source.dart';
import 'package:student_register/featuers/my_subject/data/repos/home_repo_impl.dart';
import 'package:student_register/featuers/my_subject/domain/use_cases/fetch_home_use_case.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/cubit/home_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/delete_cubit/delete_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/view/my_subject.dart';
import 'package:student_register/featuers/student_info/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/student_info/data/repo/repo_impl.dart';
import 'package:student_register/featuers/student_info/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/student_info/presentation/manager/update_cubit/update_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_register/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );

  Bloc.observer = SimpleBlocObserver();
  bool isLoggedIn =
      ((await SharedPreferences.getInstance()).getString("token") != null);
  String? user_id =
      (await SharedPreferences.getInstance()).getString("user_id");
  String? student_id =
      (await SharedPreferences.getInstance()).getString("student_id");
  String? userName =
      (await SharedPreferences.getInstance()).getString("userName");
  String? email = (await SharedPreferences.getInstance()).getString("email");
  String? first_name =
      (await SharedPreferences.getInstance()).getString("first_name");
  String? last_name =
      (await SharedPreferences.getInstance()).getString("last_name");
  String? father_name =
      (await SharedPreferences.getInstance()).getString("father_name");
  String? department_id =
      (await SharedPreferences.getInstance()).getString("department_id");
  String? academic_year =
      (await SharedPreferences.getInstance()).getString("academic_year");
  String? exam_number =
      (await SharedPreferences.getInstance()).getString("exam_number");

  runApp(MyApp(
      isLoggedIn: isLoggedIn,
      user_id: user_id,
      student_id: student_id,
      userName: userName,
      email: email,
      first_name: first_name,
      last_name: last_name,
      father_name: father_name,
      department_id: department_id,
      academic_year: academic_year,
      exam_number: exam_number));
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  MyApp(
      {this.isLoggedIn,
      this.user_id,
      this.student_id,
      this.userName,
      this.email,
      this.first_name,
      this.last_name,
      this.father_name,
      this.department_id,
      this.academic_year,
      this.exam_number});

  final isLoggedIn;
  final user_id;
  final student_id;
  final userName;
  final email;
  final first_name;
  final last_name;
  final father_name;
  final department_id;

  final academic_year;
  final exam_number;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return AuthCubit(
            FetchAuthUseCase(
              AuthRepoImpl(
                authRemoteDataSource: AuthRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            isLoggedIn: isLoggedIn,
            user_id: user_id ?? "",
            student_id: student_id ?? "",
            userName: userName ?? "",
            email: email ?? "",
            first_name: first_name ?? "",
            last_name: last_name ?? "",
            father_name: father_name ?? "",
            department_id: department_id ?? "",
          );
        }),
        BlocProvider(create: (context) {
          return DepartmentCubit(
            FetchDepartmentUseCase(
              DepartmentRepoImpl(
                departmentRemoteDataSource: DepartmentRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return StudentInfoListCubit(
            FetchStudentInfoUseCase(StudentInfoRepoImpl(
              remoteDataSource: RemoteDataSourceImpl(
                getIt.get<ApiService>(),
              ),
            )),
          );
        }),
        BlocProvider(create: (context) {
          return SubjectCubit(
              FetchSubjectUseCase(SSRepoImpl(
                ssremoteDataSource: SubjectRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              )),
              FetchStudentSubjectUseCase(SSRepoImpl(
                ssremoteDataSource: SubjectRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              )));
        }),
        BlocProvider(create: (context) {
          return HomeCubit(
            FetchHomeUseCase(
              HomeRepoImpl(
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return DeleteCubit(
            FetchHomeUseCase(
              HomeRepoImpl(
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return UpdateStudentInfoListCubit(
            FetchStudentInfoUseCase(StudentInfoRepoImpl(
              remoteDataSource: RemoteDataSourceImpl(
                getIt.get<ApiService>(),
              ),
            )),
          );
        }),
        BlocProvider(create: (context) {
          return AttendanceCubit(
            FetchAttendanceUseCase(
              AttendanceRepoImpl(
                attendanceRemoteDataSource: AttendanceRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),

      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //   initialRoute: '/',
          //   routes: {
          //     AppRouter.kSplash: (context) => SplashScreen(repository: repository),
          //     AppRouter.kHomeView: (context) => HomeView(repository: repository),
          //      },
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
            fontFamily: "Almarai",
            primarySwatch: Colors.blue,
          ),
          home:
          SplashScreen()

          ),
    );
  }
}
