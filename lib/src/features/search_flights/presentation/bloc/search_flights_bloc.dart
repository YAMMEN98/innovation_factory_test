import 'package:bloc/bloc.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/usecases/search_flights_usecase.dart';

part 'search_flights_event.dart';
part 'search_flights_state.dart';

class SearchFlightsBloc extends Bloc<SearchFlightsEvent, SearchFlightsState> {
  late SearchFlightsUseCase searchFlightsUseCase;

  SearchFlightsBloc() : super(SearchFlightsInitial()) {
    searchFlightsUseCase = sl<SearchFlightsUseCase>();
  }
}
