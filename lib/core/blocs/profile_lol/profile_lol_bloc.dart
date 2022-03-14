import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_lol_event.dart';
part 'profile_lol_state.dart';

class ProfileLolBloc extends Bloc<ProfileLolEvent, ProfileLolState> {
  ProfileLolBloc() : super(ProfileLolInitial()) {
    on<ProfileLolEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
