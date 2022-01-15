class Memory {
  bool favorite;
  String content;

  Memory(this.favorite, this.content);

  static Memory getMemoryFromDB(dynamic memory) {
    return Memory(memory["favorite"], memory["content"]);
  }
}
