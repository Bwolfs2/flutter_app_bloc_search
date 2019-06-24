import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
class HomeBloc extends BlocBase{

  List<String> lista = ["Banana", "Maca" , "Melancia" , "Mamao" , "Abacaxi"];

  HomeBloc(){
    dataFlux =  _controller.map((item)=> item == null || item == "" ? lista : lista.where((i) => i.toLowerCase().contains(item.toLowerCase())).toList());
    dataFlux.listen(print);
  }

  var _controller = BehaviorSubject<String>.seeded("");

  Observable<List<String>> dataFlux;

  Sink<String> get data => _controller.sink;

  @override
  void dispose() {

    super.dispose();
  }
}