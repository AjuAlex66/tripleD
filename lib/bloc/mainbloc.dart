import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripled/model/profilelistmodel.dart';
import 'package:tripled/model/profilemodel.dart';
import 'package:tripled/utils/helper.dart';
import 'package:tripled/utils/initializer.dart';
import 'package:tripled/utils/misc.dart';
import 'package:tripled/utils/serverhelper.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Random random = Random();
  MainBloc() : super(MainState()) {
    on<GetRandomProfile>(getRandomProfile);
    on<GetAllProfiles>(getAllProfiles);
  }

  Future<FutureOr<void>> getRandomProfile(
      GetRandomProfile event, Emitter<MainState> emit) async {
    try {
      emit(LoadingUserInformation());
      Initializer.profileModel = ProfileModel.fromJson(await ServerHelper.get(
          'https://reqres.in/api/users/${random.nextInt(6)}'));
      if (!Misc.isEmpty(Initializer.profileModel)) {
        emit(ProfileFetched(profileModel: Initializer.profileModel));
      } else {
        emit(PorfileNotFetched());
      }
    } catch (e) {
      emit(SomethingWrong());
      Helper.showLog('Something went wrong -- $e');
    }
  }

  Future<FutureOr<void>> getAllProfiles(
      GetAllProfiles event, Emitter<MainState> emit) async {
    try {
      emit(GettingAllProfiles());
      Initializer.profileListModel = ProfileListModel.fromJson(
          await ServerHelper.get('https://reqres.in/api/users/'));
      if (!Misc.isEmpty(Initializer.profileListModel.data)) {
        emit(
            AllProfilesFetched(profileListModel: Initializer.profileListModel));
      } else {
        emit(AllProfilesNotFetched());
      }
    } catch (e) {
      emit(SomethingWrong());
      Helper.showLog('Something went wrong -- $e');
    }
  }
}

class MainEvent {}

class MainState {}

class GetRandomProfile extends MainEvent {
  final int? userId;
  GetRandomProfile({required this.userId});
}

class SomethingWrong extends MainState {}

class LoadingUserInformation extends MainState {}

class ProfileFetched extends MainState {
  final ProfileModel? profileModel;
  ProfileFetched({required this.profileModel});
}

class PorfileNotFetched extends MainState {}

class GetAllProfiles extends MainEvent {}

class GettingAllProfiles extends MainState {}

class AllProfilesFetched extends MainState {
  final ProfileListModel? profileListModel;
  AllProfilesFetched({required this.profileListModel});
}

class AllProfilesNotFetched extends MainState {}
