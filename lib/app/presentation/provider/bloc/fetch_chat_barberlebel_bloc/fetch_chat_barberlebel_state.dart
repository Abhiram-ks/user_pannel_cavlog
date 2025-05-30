part of 'fetch_chat_barberlebel_bloc.dart';


@immutable
abstract class FetchChatBarberlebelState {}

final class FetchChatBarberlebelInitial extends FetchChatBarberlebelState {}
final class FetchChatBarberlebelLoading extends FetchChatBarberlebelState {}
final class FetchChatBarberlebelEmpty extends FetchChatBarberlebelState {}
final class FetchChatBarberlebelSuccess extends FetchChatBarberlebelState {
  final List<BarberModel> barbers;

  FetchChatBarberlebelSuccess(this.barbers);
}
final class FetchChatBarberlebelFailure  extends FetchChatBarberlebelState {}
