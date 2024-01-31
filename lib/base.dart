import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class BaseConnector {
  showLoading();
  showMessage(String message);
  hideLoading();
}

class BaseViewModel <CON extends BaseConnector >  extends ChangeNotifier{
  CON? conncetor;
}

 abstract class BaseView <VM extends BaseViewModel,S extends StatefulWidget> extends State <S> implements BaseConnector  {
  late VM viewModel;
  VM initMyViewModel();
  @override
   void initstate(){
    super.initState();
    viewModel=initMyViewModel();
  }
}


//  class BaseView <VM extends BaseViewModel,S extends StatefulWidget> extends State <S> implements BaseConnector  {
//   late VM viewModel;
//   VM initMyViewModel();
//   @override
//   void initstate(){
//     super.initState();
//     viewModel=initMyViewModel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   @override
//   hideLoading() {
//     // TODO: implement hideLoading
//     throw UnimplementedError();
//   }
//
//   @override
//   showLoading() {
//     // TODO: implement showLoading
//     throw UnimplementedError();
//   }
//
//   @override
//   showMessage(String message) {
//     // TODO: implement showMessage
//     throw UnimplementedError();
//   }
// }

