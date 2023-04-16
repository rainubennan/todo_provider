class TodoModel{
  late String todotitle;
  late  bool complete;
TodoModel({
    required this.todotitle,
  this.complete=false
});
void iscomplete(){
  complete =! complete;
}
}