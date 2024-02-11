typedef DictionaryData = Map<String, String>;

class Dictionary {
  DictionaryData datadict;

  Dictionary({required this.datadict});

  void add({required String term, required String definition}) {
    datadict[term] = definition;
  }

  String get({required String term}) {
    return datadict[term] ?? '해당 단어가 사전에 없습니다.';
  }

  void delete({required String term}) {
    datadict.remove([term]);
  }

  void update({required String term, required String definition}) {
    if (datadict.containsKey(term)) {
      datadict[term] = definition;
    } else {
      print('해당 단어가 사전에 없습니다.');
    }
  }

  void showAll() {
    datadict.forEach((term, definition) {
      print("$term =$definition ");
    });
  }

  int count() {
    return datadict.length;
  }

  void upsert({required String term, required String definition}) {
    datadict[term] = definition;
  }

  void exists({required String eng}) {
    if (datadict.containsKey(eng)) {
      print('해당단어가 사전에 존재합니다.');
    } else {
      print('해당 단어가 사전에 존재하지 않습니다.');
    }
  }

  void bulkAdd(List<DictionaryData> dictlist) {
    for (int i = 0; i < dictlist.length; i++) {
      add(term: dictlist[i]['term']!, definition: dictlist[i]['definition']!);
    }
  }

  void bulkDelete(List<String> dictlist) {
    for (int i = 0; i < dictlist.length; i++) {
      delete(term: datadict[i]!);
    }
  }
}

void main() {}
