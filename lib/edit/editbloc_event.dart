part of 'editbloc_bloc.dart';


sealed class EditblocEvent  {
 const EditblocEvent();

@override
List<Object>get propo=>[];
}

class TodoeditEvent extends EditblocEvent{
  String  id;
  String title;
 String description;
 TodoeditEvent({required this.id, required this.title,required this.description});
 
 

  

}
