import 'package:flutter/material.dart';

void main() => runApp(MyApp()); /*1*/

class MyApp extends StatelessWidget {/*2*/
  @override
  Widget build(BuildContext context) { /*3*/
    return MaterialApp(  /*4*/
      title: 'Welcome to Flutter',
      home: SearchPage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new SearchPage(),
        '/item': (BuildContext context) => new ItemPage()
      }
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Search Engine App')
      ),
      body: Center(
        child: SearchForm(),
      )
    );
  }
}

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  String _text = "";

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 40.0
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "$_text"
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    right: 5
                  ),
                  child: TextField(
                    enabled: true,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    maxLines: 1,
                    onChanged: _handleText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 0.5)
                      ),
                      hintText: 'Enter words you want to search'
                    )
                  )
                )
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemPage(query: _text))
                ),
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30.0
                )
              )
            ]
          )
        ]
      )
    );
  }
}

class ItemPage extends StatelessWidget {
  final String query;

  ItemPage({Key key, @required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Item'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text('Search word : $query'),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}