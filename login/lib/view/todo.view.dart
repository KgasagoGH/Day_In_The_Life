import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(TodoView());

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          titleTextStyle: GoogleFonts.getFont(
            'Raleway',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: TodoListScreen(),
      ),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> todos = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(todos[index].title),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
          ),
          onDismissed: (direction) {
            setState(() {
              todos.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Task deleted')),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Checkbox(
                value: todos[index].isDone,
                onChanged: (value) {
                  setState(() {
                    todos[index].toggleDone();
                  });
                },
              ),
              title: Text(
                todos[index].title,
                style: TextStyle(
                  decoration: todos[index].isDone ? TextDecoration.lineThrough : null,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
