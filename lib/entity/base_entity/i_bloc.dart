import 'package:bloc/bloc.dart';

abstract class IBloc<Event, State> extends Bloc<Event, State> {
  IBloc(super.initialState) {
    onEventHandler();
  }

  EventTransformer<Event>? get eventTransformer => null;

  void onEventHandler() => on<Event>(mapEvent, transformer: eventTransformer);

  Future<void> mapEvent(Event event, Emitter<State> emit);

  void whenBlocInitialized() {}
}
