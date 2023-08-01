import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:move/data/repository/Quato_repo.dart';
part 'quato_state.dart';

class QuatoCubit extends Cubit<QuatoState> {

  final QuatoRepos quatoRepos ;

  QuatoCubit(this.quatoRepos ) : super(QuatoInitial());

  // Local or API هندلة من
  void getRandomeQuote()  {

    if(_isDisposed) {
      return;
    }

    // git data in APi Or Local
    quatoRepos.getRandomeQuote().then(
            (slip) => emit(QuatoGetAdvice(slip!.advice))
    ) ;
  }

  bool _isDisposed = false;

  void dispose() {
    quatoRepos.close();
    _isDisposed = true;
  }

}
