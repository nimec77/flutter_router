import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'router_state.dart';

part 'router_cubit.freezed.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterState.firstPage());

  void firstPage() {
    emit(const RouterState.firstPage());
  }

  void secondPage() {
    emit(const RouterState.secondPage());
  }
}
