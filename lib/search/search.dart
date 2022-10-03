

import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Text('asdasd')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Text('asdasd');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('asdasd');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('asdasd: $query');
  }

}