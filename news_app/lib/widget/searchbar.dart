import 'package:flutter/material.dart';
import 'package:news_app/views/query_view.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11, right: 8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: _folded ? 56 : 400,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: !_folded
                      ? TextField(
                          // onChanged: (value) => {print(value)},
                          onSubmitted: (value) => {
                            setState(() {
                              _folded = !_folded;
                            }),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QueryNewsPage(
                                  queryname: value,
                                ),
                              ),
                            ),
                          },
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.blue[300]),
                              border: InputBorder.none),
                        )
                      : null,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_folded ? 32 : 0),
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(_folded ? 32 : 0),
                        bottomRight: Radius.circular(32)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        _folded ? Icons.search : Icons.close,
                        color: Colors.blue[900],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _folded = !_folded;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
