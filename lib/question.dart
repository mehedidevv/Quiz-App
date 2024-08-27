class Question{

  //TODO Using "late" Keyourt For Null Safety
 late String questionTittle;
 late String image;
 late bool answer;

 //TODO Creating Constructor
 Question({required String ques,required String img,required bool ans}){
   questionTittle=ques;
   image=img;
   answer=ans;

 }
}

