abstract class SocialAppStates{}
class InitialShopAppState extends SocialAppStates{}
class ChangeIndexSuccess extends SocialAppStates{}
class GetDataLoadingState extends SocialAppStates{}
class GetDataSuccessState extends SocialAppStates{}
class GetDataErrorState extends SocialAppStates{}
class TheLastSuccessState extends SocialAppStates{}
class GetProfileImageSuccess extends SocialAppStates{}
class GetDataUserLoading extends SocialAppStates{}
class GetDataUserSuccess extends SocialAppStates{}
class GetDataUserError extends SocialAppStates
{
  final String error;

  GetDataUserError(this.error);
}
class SentPostLoading extends SocialAppStates{}
class SentPostSuccess extends SocialAppStates{}
class SentPostError extends SocialAppStates
{
  final String error;

  SentPostError(this.error);
}
class UploadProfileImageLoading extends SocialAppStates{}
class UploadProfileImageSuccess extends SocialAppStates{}
class UploadProfileImageError extends SocialAppStates
{
  final String error;

  UploadProfileImageError(this.error);
}
class GetDownloadURLProfileError extends SocialAppStates
{
  final String error;

  GetDownloadURLProfileError(this.error);
}
class UploadCoverImageLoading extends SocialAppStates{}
class UploadCoverImageSuccess extends SocialAppStates{}
class UploadCoverImageError extends SocialAppStates
{
  final String error;

  UploadCoverImageError(this.error);
}
class GetDownloadURLCoverError extends SocialAppStates {
  final String error;

  GetDownloadURLCoverError(this.error);
}
class UpdateUserDataLoading extends SocialAppStates{}
class UpdateUserDataSuccess extends SocialAppStates{}
class UpdateUserDataError extends SocialAppStates
{
  final String error;

  UpdateUserDataError(this.error);
}
class UploadPostImageLoading extends SocialAppStates{}
class UploadPostImageSuccess extends SocialAppStates{}
class UploadPostImageError extends SocialAppStates
{
  final String error;

  UploadPostImageError(this.error);
}
class GetPostImageSuccess extends SocialAppStates{}
class RemovePostImage extends SocialAppStates{}
class SetPostLoading extends SocialAppStates{}
class SetPostSuccess extends SocialAppStates{}
class SetPostError extends SocialAppStates
{
  final String error;

  SetPostError(this.error);
}
class GetPostDataLoading extends SocialAppStates{}
class GetPostDataSuccess extends SocialAppStates{}
class GetPostDataError extends SocialAppStates
{
  final String error;

  GetPostDataError(this.error);
}
class GetAllUsersLoading extends SocialAppStates{}
class GetAllUsersSuccess extends SocialAppStates{}
class GetAllUsersError extends SocialAppStates
{
  final String error;

  GetAllUsersError(this.error);
}
class SentChatLoading extends SocialAppStates{}
class SentChatSuccess extends SocialAppStates{}
class SentChatError extends SocialAppStates
{
  final String error;

  SentChatError(this.error);
}
class GetChatSuccess extends SocialAppStates{}
class SentLikePostSuccess extends SocialAppStates{}
class SentLikePostError extends SocialAppStates
{
  final String error;

  SentLikePostError(this.error);
}
class GetLikesSuccess extends SocialAppStates{}
class ShowMoreState extends SocialAppStates{}
