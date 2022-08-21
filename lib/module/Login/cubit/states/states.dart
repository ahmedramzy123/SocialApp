abstract class LoginStates{}
class InitialState extends LoginStates{}
class ChangeObscureSuccessState extends LoginStates{}
class UserRigisterLoading extends LoginStates{}
class UserRigisterSuccess extends LoginStates{}
class UserRigisterError extends LoginStates{}
class UserLoginLoading extends LoginStates{}
class UserLoginSuccess extends LoginStates
{
  final String token;

  UserLoginSuccess(this.token);
}
class UserLoginError extends LoginStates
{
  final String error;

  UserLoginError(this.error);
}
class UserCreateSuccess extends LoginStates {}
class UserCreateError extends LoginStates {
  final String error;

  UserCreateError(this.error);
}
class RemoveTokenSuccess extends LoginStates {}
