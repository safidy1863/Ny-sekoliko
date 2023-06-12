part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    this.currentUser,
});

  final LoadStatus status;
  final UserEntity? currentUser;

  const AuthState.initial() : this(status: LoadStatus.initial);

  const AuthState.loading(): this(status: LoadStatus.loading);

  const AuthState.success(UserEntity? user) :
        this(status: LoadStatus.success, currentUser: user);

  const AuthState.error() : this(status: LoadStatus.error);

  const AuthState.networkError() : this(status: LoadStatus.networkError);

  @override
  List<Object?> get props => [status,currentUser];
}