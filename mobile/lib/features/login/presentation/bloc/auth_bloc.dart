import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/domain/entity/user_entity.dart';
import '/core/utils/enums/load_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {

  AuthBloc() : super(const AuthState.initial()) {
    on<LoginEvent>(_mapLoginEventWithState);
  }

  void _mapLoginEventWithState(
      LoginEvent event, Emitter<AuthState> emit
      ) async {
    try  {
      emit(const AuthState.loading());
      final user = UserEntity(name: event.name, password: event.password);
      emit(AuthState.success(user));
    } catch (e) {
      print(e);
      emit(const AuthState.error());
    }
  }
}