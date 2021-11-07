import 'package:flutter/material.dart';
import 'package:todo_app/core/network/http_client.dart';
import 'package:todo_app/core/widget/listview_widget.dart';
import 'package:todo_app/feature/todo/domain/entity/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<ToDo>>(
              future: fetchTodos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Something went wrong',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16.0),
                        const Text('Give it another try'),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                fetchTodos();
                              });
                            },
                            child: const Text('RELOAD')),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListViewWidget(todos: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
