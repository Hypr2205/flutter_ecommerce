abstract class Feature<Type, Params> {
  Future<Type> call({Params params});
}
