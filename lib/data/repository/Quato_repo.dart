import 'package:move/data/models/Quato/Advice.dart';
import 'package:move/data/models/Quato/Slip.dart';
import 'package:move/data/web_services/Quato_api.dart';

class QuatoRepos {
  //! in Internet
  QuatoAPi quatoAPi;

  //! in Local Data
  //final CharactersLocal charactersLocal ;

  QuatoRepos(this.quatoAPi);

  // Local or API هندلة من
  Future<Slip?> getRandomeQuote() async {
    // git data in APi Or Local
    Map<String, dynamic> repo = await quatoAPi.getRandomeQuote();
    return Advice.fromJson(repo).slip ;
  }

  void close(){
    quatoAPi.close() ;
  }
}
