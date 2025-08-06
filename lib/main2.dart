import 'package:flutter/material.dart';

class con extends StatefulWidget {
  const con({super.key});

  @override
  State<con> createState() => _conState();
}

class _conState extends State<con> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<Map<String, String>> contact =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(child: Text('Contact List',style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blueGrey,
        
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(

                  controller: numberController,

                  decoration: InputDecoration(
                    label: Text('Number'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 40),backgroundColor: Colors.blueGrey),
                    onPressed: (){
                      setState(() {
                        contact.add({
                          'name': nameController.text,
                          'number': numberController.text,
                        });
                      });
                      numberController.clear();
                      nameController.clear();
                    },
                    child: Text('Add',style: TextStyle(color: Colors.white),)),
              ),
            ],

          ),



           Expanded(
             child: ListView.builder(
               itemCount: contact.length,
               itemBuilder: (context, index){
                 return Card(
                   child: ListTile(
                     title:Text(contact[index]['name'] ?? ''),
                     subtitle: Text(contact[index]['number'] ?? ''),
                     leading: Icon(Icons.contact_page),
                     trailing: Icon(Icons.call),


                     onLongPress: (){
                       
                       showDialog(context: context, builder: (context)=> AlertDialog(
                         title: Text('Delete Contact'),
                         content: Text('Are you sure you want to delete this contact?'),
                         actions: [
                           TextButton(onPressed: (){
                             Navigator.pop(context);
                           }, child: Text('Cancel'),
                           ),
TextButton(onPressed: (){
setState(() {
  contact.removeAt(index);
});
Navigator.pop(context);
}, child: Text('Delete')),

                         ],
                         
                         
                         
                       ));
                     },
                     





                   ),
                 );

               }
             ),
           )



        ],
      ),

    );
  }
}
