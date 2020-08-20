import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/models/user_model.dart';

class UserDataLoadedAction extends Equatable {
  final User user;

  UserDataLoadedAction({this.user});

  @override
  List<Object> get props => [user];
}

class UserDataLoadingFailedAction {
  UserDataLoadingFailedAction();
}

ThunkAction<AppState> loadUserData() {
  return (Store<AppState> store) async {
    // FirebaseUser user;
    // try {
    //   user = await ApiClient().loadUserData();
    //   if (user != null) {
    //     print((await user.getIdToken()).token);

    //     store.dispatch(
    //       UserDataLoadedAction(
    //         user: store.state.user.copyWith(firebaseUser: user),
    //       ),
    //     );
    //   } else {
    //     store.dispatch(UserDataLoadingFailedAction());
    //   }
    // } catch (e) {
    //   print(e);
    // }
  };
}

// ThunkAction<AppState> signInWithEmailAndPassword(
//     {String email, String password}) {
//   return (Store<AppState> store) async {
//     AuthResult result;
//     try {
//       result = await ApiClient().signInWithEmailAndPassword(email, password);
//       if (result.user != null) {
//         store.dispatch(
//           SignInSuccessAction(
//             user: User(
//               email: email,
//               password: password,
//               firebaseUser: result.user,
//             ),
//           ),
//         );
//       } else {
//         store.dispatch(SignInFailedAction());
//       }
//     } catch (e) {
//       print(e);
//     }
//   };
// }

// ThunkAction<AppState> signOut() {
//   return (Store<AppState> store) async {
//     try {
//       await ApiClient().signOut();
//       store.dispatch(SignOutSuccessAction());
//     } catch (e) {
//       print(e);
//     }
//   };
// }
