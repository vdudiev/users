import 'package:meta/meta.dart';
import 'package:users/navigation/app_router.dart';

/// Контейнер зависимостей-утилит.
@immutable
class UtilsDiContainer {
  /// Class that coordinates navigation for the whole app.
  final AppRouter router;

  const UtilsDiContainer._({
    required this.router,
  });

  /// @nodoc
  factory UtilsDiContainer.create() {
    return UtilsDiContainer._(
      router: AppRouter.instance(),
    );
  }
}
