import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_application/screens/noteEditor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} // StatefulWidget

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 255, 255),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Notes"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 186, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recent Notes: ", style: GoogleFonts.roboto(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 22,),
              ),
              const SizedBox(height: 20.0,);
              
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if(snapshot.hasData){
                      return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: snapshot.data!docs
                      .map((note) => noteCard((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteReaderScreen(note),));
                      }, note))
                      .toList(),
                      );
                    }
                  return Text("There's no Notes", style: GoogleFonts.nunito(color: Colors.black),);
                  },
                ),
              )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NoteEditorScreen()));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
        ),

    );
  }
} // State