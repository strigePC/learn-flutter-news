import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/item_model.dart';

class CommentsBloc {
  final _repository = Repository();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _commentsFetcher = PublishSubject<int>();

//  Streams
  Observable<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

//  Sink
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }

  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (cache, int id, index) {
          cache[id] = _repository.fetchItem(id);
          cache[id].then((ItemModel item) {
            item.kids.forEach((kidId) => fetchItemWithComments(kidId));
          });
        },
      <int, Future<ItemModel>> {

      }
    );
  }
}
