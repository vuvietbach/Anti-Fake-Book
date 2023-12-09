import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/device.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/device.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

// class SetDevtokenAction
//     extends FutureAction<SetDevtokenAction, SetDevtokenResponse> {
//   final SetDevtokenRequest data;
//   final Function? onSuccess;
//   final Function? onPending;
//   final Function? onError;
//   SetDevtokenAction(
//       {required this.data, this.onSuccess, this.onPending, this.onError})
//       : super(future: ApiModel.api.setDevtoken(data), extras: {
//           'onSuccess': onSuccess,
//           'onPending': onPending,
//           'onError': onError
//         });
// }

// typedef SuccessSetDevtokenAction
//     = FutureSucceededAction<SetDevtokenAction, SetDevtokenResponse>;
// typedef PendingSetDevtokenAction = FuturePendingAction<SetDevtokenAction>;
